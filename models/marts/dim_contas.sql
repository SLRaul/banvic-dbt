
with 
    tb_agencias as (
        select *
        from {{ ref('int_dim_contas') }}
    )
select * from tb_agencias