USE GestaoPEdagogica
GO

--tabela de escola, consulta pelo nome
select * from ESC_Escola where esc_nome like '%22 de mar%'

--sabendo a DRE daquela escola
select uad_nome, * from ESC_Escola esc inner join CoreSSO..SYS_UnidadeAdministrativa uad on uad.uad_id = esc.uad_idSuperiorGestao where esc_nome like '%22 de mar%'

--turmas do ano atual
select * 
  from TUR_Turma tur
	   inner join ACA_CalendarioAnual cal on cal.cal_id = tur.cal_id and cal.cal_ano = 2018 
 where tur_situacao = 1 --= turmas ativas

--turmas do ano atual
select * 
  from TUR_Turma tur
	   inner join ACA_CalendarioAnual cal on cal.cal_id = tur.cal_id and cal.cal_ano = 2018 
	   inner join ESC_Escola esc on esc.esc_id = tur.esc_id --join com a tabela de escolas
 where tur_situacao = 1 --= turmas ativas

--relacionamento das turmas com os cursos
select *
  from TUR_Turma tur
	   inner join ACA_CalendarioAnual cal on cal.cal_id = tur.cal_id
	   inner join TUR_TurmaCurriculo tcr on tcr.tur_id = tur.tur_id and tcr.tcr_situacao = 1 --relacionamento da turma com os cursos
	   inner join ACA_Curso cur on cur.cur_id = tcr.cur_id --join apenas para pegar o nome do curso
	   inner join ACA_CurriculoPeriodo crp on crp.cur_id = tcr.cur_id and crp.crp_id = tcr.crp_id --join para pegar o nome da s�rie
 where cal_ano = 2018 and tur.esc_id = 134
 
--relacionamento das turmas com as disciplinas
select *
  from TUR_Turma tur
	   inner join ACA_CalendarioAnual cal on cal.cal_id = tur.cal_id
	   inner join TUR_TurmaCurriculo tcr on tcr.tur_id = tur.tur_id and tcr.tcr_situacao = 1 --relacionamento da turma com os cursos
	   inner join ACA_Curso cur on cur.cur_id = tcr.cur_id --join apenas para pegar o nome do curso
	   inner join ACA_CurriculoPeriodo crp on crp.cur_id = tcr.cur_id and crp.crp_id = tcr.crp_id --join para pegar o nome da s�rie
	   inner join TUR_TurmaRelTurmaDisciplina trel on trel.tur_id = tur.tur_id
	   inner join TUR_TurmaDisciplina tud on tud.tud_id = trel.tud_id -- join com a tabela de disciplinas
 where cal_ano = 2018 and tur.esc_id = 134

--relacionamento da Disciplina com a tabela de docentes
 select *
  from TUR_Turma tur
	   inner join ACA_CalendarioAnual cal on cal.cal_id = tur.cal_id
	   inner join TUR_TurmaCurriculo tcr on tcr.tur_id = tur.tur_id and tcr.tcr_situacao = 1 --relacionamento da turma com os cursos
	   inner join ACA_Curso cur on cur.cur_id = tcr.cur_id --join apenas para pegar o nome do curso
	   inner join ACA_CurriculoPeriodo crp on crp.cur_id = tcr.cur_id and crp.crp_id = tcr.crp_id --join para pegar o nome da s�rie
	   inner join TUR_TurmaRelTurmaDisciplina trel on trel.tur_id = tur.tur_id
	   inner join TUR_TurmaDisciplina tud on tud.tud_id = trel.tud_id -- join com a tabela de disciplinas
	   inner join TUR_TurmaDocente tdt on tdt.tud_id = tud.tud_id
 where cal_ano = 2018 and tur.esc_id = 134

--principal tabela para verificar se um aluno est� numa turma (ela � par da tabela ACA_AlunoCurriculo e MTR_Movimentacao):
select * from MTR_MAtriculaTurma

-- tabela de alunos
 select * from ACA_Aluno

--Tabela de v�nculos de colaboradores com escola:
select * from RHU_ColaboradorCargo

--Tabela de pessoas 
select * from CoreSSO..PES_Pessoa --relacionar com a tabela de aluno ou com cargo, ou com respons�vel caso queira ver o nome da pessoa

--DEPARAS IMPORATNTES do banco Manutencao
select * from Manutencao..DEPARA_SERIE 
select * from Manutencao..DEPARA_CURSO_GRADES 
select * from Manutencao..DEPARA_DISCIPLINAS

--PARAMETROS do banco Manutencao
select * from Manutencao.._PARAMETROS
select * from Manutencao.._DATACRIACAO --data de altera��o das STPS pela �ltima vez 

--Tabelas de logs do processo de integra��o
select * from Manutencao..Package
select * from Manutencao..PackageLog
select * from Manutencao..PackageTaskLog
