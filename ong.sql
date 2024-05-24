create database banco_dados_ONG;
use banco_dados_ONG;

create table equipeONG (
    registro int(10) auto_increment,
	priNome character(255) not null,
    sobrenome character(255) not null,
    cpf int(11) not null,
    dataNascimento date not null,
    estadoCivil character(255) not null,
    constraint pk_equipeONG primary key (registro),
    constraint un_equipeONG unique (cpf)
);

create table equipeONG_contato (
	contatoFixo int(10),
    contatoCelular int(11),
    registro_ong int(10) not null,
    constraint fk_equipeONG_contato foreign key (registro_ong) references equipeONG (registro)
);

create table equipeONG_endereco (
	endereco character(255) not null,
    registro_ong int(10) not null,
    constraint fk_equipeONG_endereco foreign key (registro_ong) references equipeONG (registro)
);

create table voluntario (
    registro int(10) auto_increment,
	priNome character(255) not null,
    sobrenome character(255) not null,
    cpf int(11) not null,
    Tipo character(255) not null,
    dataNascimento date not null,
    estadoCivil character(255) not null,
    matricula_ong int(11) not null,
    vol_gerencia int(10) not null,
    constraint pk_voluntario primary key (registro),
	constraint un_voluntario unique (cpf),
    constraint fk_voluntario foreign key (vol_gerencia) references voluntario (registro)
);

create table voluntario_contato (
	contatoFixo int(10),
    contatoCelular int(11),
    registro_vol int(10) not null,
    constraint fk_voluntario_contato foreign key (registro_vol) references equipeONG (registro)
);

create table voluntario_endereco (
	endereco character(255) not null,
    registro_vol int(10) not null,
    constraint fk_voluntario_endereco foreign key (registro_vol) references equipeONG (registro)
);

create table crianca_adolescente (
	registro int(10) auto_increment,
	priNome character(255) not null,
    sobrenome character(255) not null,
    cpf int(11) not null,
    dataNascimento date not null,
    abandono char(1) not null,
    matricula_ong int(10) not null,
    constraint pk_crianca_adolescente primary key (registro),
    constraint un_crianca_adolescente unique (cpf)
);

create table cri_contato (
	contatoFixo int(10),
    contatoCelular int(11),
    registro_Cri int(10) not null,
    constraint fk_cri_contato foreign key (registro_cri) references crianca_adolescente (registro)
);

create table cri_endereco (
	endereco character(255) not null,
    registro_cri int(10) not null,
    constraint fk_cri_endereco foreign key (registro_cri) references crianca_adolescente (registro)
);

create table dependente (
	registro int(10) auto_increment,
	priNome character(255) not null,
    sobrenome character(255) not null,
    cpf int(11) not null,
    dataNascimento date not null,
    constraint pk_crianca_adolescente primary key (registro),
	constraint un_dependente unique (cpf)
);

create table verba (
	registro int(10) auto_increment,
    tipo char(1) not null,
    valor double(20,2) not null,
    doador character(255) not null,
    descricao character(255) not null,
    constraint pk_verba primary key (registro)
);

create table colaborador (
	registro int(10) auto_increment,
    cpf_cnpj int(14) not null,
    descricao character(255) not null,
    constraint pk_colaborador primary key (registro),
    constraint un_colaborador unique (cpf_cnpj)
);

create table area_atuacao (
	registro int(10) auto_increment,
    nome character(255) not null,
    descricao character(255) not null,
    ong_gerencia int(10) not null,
    constraint pk_area_atuacao primary key (registro)
);

create table cri_dependente (
	registro_cri int(10) not null,
    registro_dep int(10) not null,
    constraint fk_cri_dependente01 foreign key (registro_cri) references crianca_adolescente (registro),
    constraint fk_cri_dependente02 foreign key (registro_dep) references dependente (registro)
);

create table equipe_ong_colabaradores (
	registro_ong int(10) not null,
    registro_col int(10) not null,
    constraint equipe_ong_colabarador01 foreign key (registro_ong) references equipeong (registro),
    constraint equipe_ong_colabarador02 foreign key (registro_col) references colaborador (registro)
);

create table equipe_ong_verba (
	registro_ong int(10) not null,
    registro_ver int(10) not null,
	tipo char(1) not null,
    constraint equipe_ong_verba01 foreign key (registro_ong) references equipeong (registro),
    constraint equipe_ong_verba02 foreign key (registro_ver) references verba (registro)
);

create table verba_colabaradores (
	registro_ver int(10) not null,
    registro_col int(10) not null,
    constraint verba_colabaradores01 foreign key (registro_ver) references verba (registro),
    constraint verba_colabaradores02 foreign key (registro_col) references colaborador (registro)
);

create table colabaradores_ajuda_area_atuacao (
	registro_ara int(10) not null,
    registro_col int(10) not null,
    constraint colabaradores_ajuda_area_atuacao01 foreign key (registro_ara) references area_atuacao (registro),
    constraint colabaradores_ajuda_area_atuacao02 foreign key (registro_col) references colaborador (registro)
);

create table voluntario_ajuda_area_atuacao (
	registro_ara int(10) not null,
    registro_vol int(10) not null,
    constraint voluntario_ajuda_area_atuacao01 foreign key (registro_ara) references area_atuacao (registro),
    constraint voluntario_ajuda_area_atuacao02 foreign key (registro_vol) references voluntario (registro)
);

alter table crianca_adolescente add constraint fk_crianca_adolescente foreign key (matricula_ong) references equipeong (registro);
alter table area_atuacao add constraint fk_area_atuacao foreign key (ong_gerencia) references equipeong (registro);
alter table voluntario add constraint fk_voluntario01 foreign key (matricula_ong) references equipeong (registro);


    