-- =====================================================================
--  La Costa Botanera · Punto de venta
--  Base de datos para Supabase. Pega TODO este archivo en:
--  Supabase → SQL Editor → New query → Run
-- =====================================================================

-- 1) Tabla única donde el programa guarda todo (menú, usuarios, mesas,
--    cuentas, pedidos, ventas, cortes, inventario y bitácora).
create table if not exists public.docs (
  path        text primary key,          -- ej. "sales/abc123"
  col         text not null,             -- ej. "sales"
  data        jsonb not null,
  updated_at  timestamptz not null default now()
);
create index if not exists docs_col_idx on public.docs (col);

-- 2) Seguridad: solo los dispositivos que entraron con la cuenta del
--    negocio pueden leer y escribir. Nadie más (ni con la clave pública).
alter table public.docs enable row level security;

drop policy if exists "negocio lee"      on public.docs;
drop policy if exists "negocio agrega"   on public.docs;
drop policy if exists "negocio actualiza" on public.docs;
drop policy if exists "negocio borra"    on public.docs;

create policy "negocio lee"       on public.docs for select to authenticated using (true);
create policy "negocio agrega"    on public.docs for insert to authenticated with check (true);
-- La bitácora no se puede modificar, solo agregar (y archivar al cerrar turno).
create policy "negocio actualiza" on public.docs for update to authenticated using (col <> 'log') with check (col <> 'log');
create policy "negocio borra"     on public.docs for delete to authenticated using (true);

-- 3) Tiempo real: para que cocina, barra y caja vean los cambios al momento.
alter table public.docs replica identity full;
do $$ begin
  alter publication supabase_realtime add table public.docs;
exception when duplicate_object then null; end $$;

-- Listo. Ahora crea la cuenta del negocio en Authentication → Users.
