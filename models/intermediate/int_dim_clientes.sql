
with 
    clientes as (
        select *
        from {{ ref('stg_erp__clientes') }}
    ),

    localidades as (
        select *
        from {{ ref('stg_erp__localidades') }}
    ),

    clientes_enriquecida as (
        select 
            cli.pk_cliente,
            cli.fk_localidade,
            cli.nome_cliente,
            cli.email_cliente,
            cli.tipo_cliente,
            cli.ts_inclusao,
            cli.cpfcnpj,
            cli.data_nascimento_cliente,
            cli.endereco_cliente,
            cli.cep_cliente,
            loc.cidade as cidade_cliente,
            loc.uf as uf_cliente
        from clientes as cli
        left join localidades as loc on cli.fk_localidade = loc.cod_localidade
    )

    select *
    from clientes_enriquecida
