create table if not exists public.shot_checks (
  project_id text not null,
  shot_id text not null,
  checked boolean not null default false,
  updated_at timestamptz not null default now(),
  primary key (project_id, shot_id)
);

alter table public.shot_checks enable row level security;

grant usage on schema public to anon;
grant select, insert, update on table public.shot_checks to anon;

drop policy if exists "daytripper_read" on public.shot_checks;
drop policy if exists "daytripper_add" on public.shot_checks;
drop policy if exists "daytripper_update" on public.shot_checks;

create policy "daytripper_read"
on public.shot_checks
for select
to anon
using (project_id = 'daytripper-krowne-2026');

create policy "daytripper_add"
on public.shot_checks
for insert
to anon
with check (project_id = 'daytripper-krowne-2026');

create policy "daytripper_update"
on public.shot_checks
for update
to anon
using (project_id = 'daytripper-krowne-2026')
with check (project_id = 'daytripper-krowne-2026');

do $$
begin
  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'shot_checks'
  ) then
    alter publication supabase_realtime add table public.shot_checks;
  end if;
end
$$;
