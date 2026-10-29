unit UBibAgricola;

interface

uses Forms, Dialogs, OracleData;

type TBibAgricola = class
  private
    function mensagemPrecaucaoUsoPadrao: string;
    function mensagemPrecaucaoUsoGrasel: string;
    function mensagemObservacoesPadrao: string;
    function mensagemObservacoesGrasel: string;
    function personalizaRelatorioPlantiagro(pRelatorio: TForm): TForm;
    function localAplicacaoReceitaGrasel(pCadastroDataSet: TOracleDataSet): string;
  public
    function mensagemPrecaucaoUso: string;
    function mensagemObservacoes: string;
    function personalizaRelatorio(pRelatorio: TForm): TForm;
    function localAplicacaoReceita(pCadastro: TOracleDataSet): string;
    function quantidadeReceita(pQuery: TOracleDataSet): double;
end;

implementation

uses UParamSistema_cl, TypInfo, UReceita_cl, UOracle_cl, UCadastro_cl;

{ TBibAgricola }

function TBibAgricola.localAplicacaoReceita(pCadastro: TOracleDataSet): string;
begin
  with DMCadastro do
  begin
    result := QCadastroDESC_ENDERECO.Value;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
      result := localAplicacaoReceitaGrasel(pCadastro);
  end;
end;

function TBibAgricola.localAplicacaoReceitaGrasel(
  pCadastroDataSet: TOracleDataSet): string;
begin
  result := pCadastroDataSet.FieldByName('DESC_BAIRRO').Value;
end;

function TBibAgricola.mensagemObservacoes: string;
begin
  result := mensagemObservacoesPadrao;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
    result := mensagemObservacoesGrasel;
end;

function TBibAgricola.mensagemObservacoesGrasel: string;
begin
  result :=
    'Conforme Resolucao Estadual n. '
      + '22/85, fica permitido a aplicacao de '
      + 'defensivos agricolas com o uso de '
      + 'tratores e pulverizadores ate 250 m '
      + 'e ate 50 m com o uso de aparelhos '
      + 'costais, de distancia de mananciais, '
      + 'moradias e agrupamentos de '
      + 'animais. MIP: Recomendavel utilizar '
      + 'outros metodos de controle (ex. '
      + 'cultural, biologico, etc). MEP: '
      + 'Qualquer agente de controle pode '
      + 'ficar menos efetivo ao longo do '
      + 'tempo quando a praga desenvolve '
      + 'algum tipo de resistencia, para '
      + 'prolongar a vida util dos agrotoxicos '
      + 'poderiamos utilizar as estrategias: '
      + 'nao utilizar para controle agrotoxico '
      + 'da mesma classe ou modo de acao '
      + 'em geracoes consecutivas da '
      + 'mesma praga, utilizar doses '
      + 'recomendadas na bula, ler a bula '
      + 'atentamente.';
end;

function TBibAgricola.mensagemObservacoesPadrao: string;
begin
  result :=
    'Conforme Resolucao Estadual n. '
      + '22/85, fica permitido a aplicacao de '
      + 'defensivos agricolas com o uso de '
      + 'tratores e pulverizadores ate 250 m '
      + 'e ate 50 m com o uso de aparelhos '
      + 'costais, de distancia de mananciais, '
      + 'moradias e agrupamentos de '
      + 'animais. MIP: Recomendavel utilizar '
      + 'outros metodos de controle (ex. '
      + 'cultural, biologico, etc). MEP: '
      + 'Qualquer agente de controle pode '
      + 'ficar menos efetivo ao longo do '
      + 'tempo quando a praga desenvolve '
      + 'algum tipo de resistencia, para '
      + 'prolongar a vida util dos agrotoxicos '
      + 'poderiamos utilizar as estrategias: '
      + 'nao utilizar para controle agrotoxico '
      + 'da mesma classe ou modo de acao '
      + 'em geracoes consecutivas da '
      + 'mesma praga, utilizar doses '
      + 'recomendadas na bula, ler a bula '
      + 'atentamente e o verso desta receita '
      + 'agronomica. ';
end;

function TBibAgricola.mensagemPrecaucaoUso: string;
begin
  result := mensagemPrecaucaoUsoPadrao;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASEL' then
    result := mensagemPrecaucaoUsoGrasel;
end;

function TBibAgricola.mensagemPrecaucaoUsoGrasel: string;
begin
  result :=
    '- Para  embalagens em  plástico  rígido,  vidro  ou  metal, '
      + 'após o completo esvaziamento, devem ser enxaguadas 3 vezes, '
      + 'com agitação, e as  caldas resultantes vertidas no tanque de '
      + 'pulverização. Inutilize as embalagens lavadas.' + #13#10
      + '- Fica proibido o enterrio,  queima ou abandono de embalagens. '
      + 'Armazene-as na propriedade, longe de pessoas, animais, alimentos, '
      + 'residências.  A devolução é obrigatória (Lei 9974/2000) '
      + 'no prazo de ate um ano.' + #13#10
      + '- Saiba com o seu revendedor o local para entrega das embalagens, '
      + 'ou entregue-as diretamente na A.C.C.O, Linha Três Fazendas, '
      + 'Santa Terezinha de Itaipu-Pr.';

end;

function TBibAgricola.mensagemPrecaucaoUsoPadrao: string;
begin
  result :=
    'REALIZAR TRIPLICE LAVAGEM '
    + 'DAS EMBALAGENS E '
    + 'DEPOSITAR EM '
    + 'LOCAL SEGURO, ATE O '
    + 'MOMENTO DA DEVOLUCAO.';
end;

function TBibAgricola.personalizaRelatorio(pRelatorio: TForm): TForm;
var wDosagem: string;
begin

  // Para relatório padrão
  wDosagem := '';
  wDosagem := DMOracle.FastSelect('DESC_UNIDADE_DOSAGEM_RECEITA'
    , 'TB_PRODUTO'
    , 'COD_PRODUTO = ' + DMReceita.QRReceituarioCOD_PRODUTO.Text);

  if wDosagem <> '' then
  begin
    setPropValue(pRelatorio.FindComponent('QRLabel29'), 'Caption'
    , 'DOSAGEM ' + wDosagem + '/HA'); 
  end;
  result := pRelatorio;

  //Relatórios personalizados
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PLANTIAGRO' then
    result := personalizaRelatorioPlantiagro(pRelatorio);
end;

function TBibAgricola.personalizaRelatorioPlantiagro(
  pRelatorio: TForm): TForm;
begin
  setPropValue(pRelatorio.FindComponent('QRLabel8'), 'Enabled',
    false);
  setPropValue(pRelatorio.FindComponent('QRDBText11'), 'Enabled',
    false);
  setPropValue(pRelatorio.FindComponent('QRDBText27'), 'Enabled',
    false);
  result := pRelatorio;
end;

function TBibAgricola.quantidadeReceita(pQuery: TOracleDataSet): double;
begin
  if (DMParamsistema.QParamSistemaCOD_EMPRESA.Value = 'PLANTIAGRO') or
    (DMParamsistema.QParamSistemaCOD_EMPRESA.Value = 'MULTAGRO') then
    result :=
      pQuery.FieldValues['QT_QUANTIDADE'] * pQuery.FieldValues['NUM_EMBALAGEM']
  else
    result :=
      pQuery.FieldValues['QT_QUANTIDADE']
        * pQuery.FieldValues['NUM_EMBALAGEM_RECEITA'];
end;

end.
