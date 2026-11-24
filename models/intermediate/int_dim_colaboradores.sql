
with 
    colaboradores as (
        select *
        from {{ ref('stg_erp__colaboradores') }}
    ),

    localidades as (
        select *
        from {{ ref('stg_erp__localidades') }}
    ),

    colaboradores_enriquecida as (
        select 
            colab.pk_colaborador,
            colab.fk_gerente,
            colab.nome_colaborador,
            colab.email_colaborador,
            colab.cpf_colaborador,
            colab.data_nascimento_colaborador,
            colab.endereco_colaborador,
            colab.cep_colaborador,
            loc.cidade as cidade_colaboradore,
            loc.uf as uf_colaboradore
        from colaboradores as colab
        left join localidades as loc on colab.fk_localidade = loc.cod_localidade
    )

    select *
    from colaboradores_enriquecida
