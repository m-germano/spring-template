create table aln_aluno (
    aln_id bigint generated always as identity,
    aln_ra bigint not null,
    aln_nome varchar(100) not null,
    aln_data_nascimento date,
    primary key (aln_id),
    constraint aln_nome_uk unique (aln_ra)
);

insert into aln_aluno (
    aln_ra,
    aln_nome,
    aln_data_nascimento
)
values
    (1, 'John Doe', '2001-08-10'),
    (2, 'Jane Smith', '2002-10-21');
