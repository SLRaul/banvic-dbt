
with 
    tb_colaboradores as (
        select *
        from {{ ref('int_dim_colaboradores') }}
    )
select * from tb_colaboradores