
with 
    agencias as (
        select *
        from {{ ref('stg_erp__agencias') }}
    ),

    localidades as (
        select *
        from {{ ref('stg_erp__localidades') }}
    ),

    agencias_enriquecida as (
        select 
            agc.pk_agencia,
            agc.nome_agencia,
            agc.endereco_agencia,
            agc.data_abertura_agencia,
            agc.tipo_agencia,
            loc.cidade as cidade_colaboradore,
            loc.uf as uf_colaboradore
        from agencias as agc
        left join localidades as loc on agc.fk_localidade = loc.cod_localidade
    )

    select *
    from agencias_enriquecida
