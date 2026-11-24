
with 
    tb_clientes as (
        select *
        from {{ ref('int_dim_clientes') }}
    )
select * from tb_clientes