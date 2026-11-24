
with 
    tb_agencias as (
        select *
        from {{ ref('int_dim_agencias') }}
    )
select * from tb_agencias