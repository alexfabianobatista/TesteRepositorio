unit UTReinf_R2055;

interface

uses
  Windows, Messages, SysUtils, DateUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, UFmFilial,
  Mask, UBibliotecaDB, UOracle_cl, UGeraXMLReinf, UUsuario_cl, UBibSped ;

type
  TFGeraR2055 = class(TFTParametro)
    R2055: TTabSheet;
    Label10: TLabel;
    MeDataIniReinf: TMaskEdit;
    Label11: TLabel;
    MeDataFinReinf: TMaskEdit;
    FmFilialReinf: TFmFilial;
    Label1: TLabel;
    Label2: TLabel;
    ConciliacaoR2055: TTabSheet;
    FmFilial1: TFmFilial;
    MEDataIni1: TMaskEdit;
    MEDataFim1: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GeraReinfR1000;
    procedure GeraReinfR2055;
    procedure Gerar;
    procedure EncerrarMes;
    procedure GeraReinfR2099(tem2010, tem2020, tem2030, tem2040, tem2050, tem2055, tem2060, temPagamento: boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGeraR2055: TFGeraR2055;
  BibDB: TBibliotecaDB;
  BibSped: TBibSped;
  wTem2010, wTem2020, wTem2030, wTem2040, wTem2050, wTem2055, wTem2060, wTemPagamento: boolean;

implementation

uses UReinf_cl, UFilial_cl, DB, UCadastro_cl, StrUtils,
  URConsolidacaoR2055;

{$R *.dfm}

procedure TFGeraR2055.FormCreate(Sender: TObject);
var
  wHoje, wInicioMes, wFimMes: TDate;
begin
  inherited;

  if BibSped = nil then
    BibSped := tBibSped.Create;

  wHoje := BibSped.GetDateInDateTime(Now);
  wInicioMes := BibSped.GetStartOfPreviousMonth(wHoje);
  wFimMes := BibSped.GetEndOfPreviousMonth(wHoje);

  MeDataIniReinf.Text := FormatDateTime('dd/mm/yyyy', wInicioMes);
  MeDataFinReinf.Text := FormatDateTime('dd/mm/yyyy', wFimMes);

  MeDataIni1.Text := FormatDateTime('dd/mm/yyyy', wInicioMes);
  MEDataFim1.Text := FormatDateTime('dd/mm/yyyy', wFimMes);

end;

procedure TFGeraR2055.GeraReinfR1000;
var
  GeraXML: TGeraXMLReinf;
  wCodR1000: integer;
  periodo: TDateTime;
begin
  if BibSped = nil then
    BibSped := tBibSped.Create;

  with DMFilial, DMReinf, DMUsuario do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK', StrToInt(Trim(FmFilialReinf.MeFilial.Text)));
    QFilial.Open;
    QReinfR1000.Close;
    QReinfR1000.Open;
    QReinfR1000.Insert;
    QReinfR1000COD_FILIAL.Value := QFilialCOD_FILIAL.Value;
    QReinfR1000COD_CADASTRO.Value := QFilialCOD_CADASTRO_REINF.Value;
    QReinfR1000DT_INI_VALIDADE.Value := BibSped.GetDateInDateTime(StrToDateTime(MeDataIniReinf.Text));
    QReinfR1000IND_TIPO_APLICATIVO.Value := 1; // 1 - Contribuinte | 2 - Governamental
    QReinfR1000COD_CLASSIFICACAO_TRIBUTARIA.Value := QFilialCOD_CLASSIFICACAO_TRIBUTARIA.Value;
    if not (QFilialCOD_CLASSIFICACAO_TRIBUTARIA.Value in [2,3,99]) then
      QReinfR1000IND_DESONERACAO_FOLHA.Value := 0; //na tabela da filial é NAO - VALUEUNCHECKED

    if (QFilialIND_DESONERACAO_CPRB.Text = '') or (QFilialIND_DESONERACAO_CPRB.Text = 'NAO') then
      QReinfR1000IND_DESONERACAO_FOLHA.Value := 0
    else
      QReinfR1000IND_DESONERACAO_FOLHA.Value := 1;

    if (QFilialIND_OBRIGA_ECD.Text = '') or (QFilialIND_OBRIGA_ECD.Text = 'NAO') then
      QReinfR1000IND_ECD.Value := 0
    else
      QReinfR1000IND_ECD.Value := 1;

    QReinfR1000IND_SIT_PESSOA_JURIDICA.Value := QFilialIND_SITUACAO_REINF.Value;
    QReinfR1000IND_PRODUCAO_HOMOLOGACAO.Value := QFilialIND_AMBIENTE_REINF.Value;
    QReinfR1000IND_ACORDO_MULTA.Value := 0; // 0 - sem acordo | 1 - com acordo : apenas para orgãos internacionais

    if (QFilialCOD_CADASTRO_REINF.Text <> '') and (QFilialCOD_CADASTRO_REINF.Value > 0) then
    begin
      with DMCadastro do
      begin
        QCadastro.Close;
        QCadastro.SetVariable('PK', QFilialCOD_CADASTRO_REINF.Value);
        QCadastro.Open;

        QReinfR1000COD_CADASTRO.Value := QFilialCOD_CADASTRO_REINF.Value;
      end;
    end;


    QReinfR1000IND_INC_ALT_EXC.Value := 0; //0 - inclusao; 1 alteracao; 2 - exclusao
    QReinfR1000COD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;

    wCodR1000 := QReinfR1000COD_REINF_R1000.Value;

    QReinfR1000.Post;

    GeraXML.GerarR1000(wCodR1000, 'R-1000', QFilialDESC_VERSAO_REINF.Text);

  end;


end;

procedure TFGeraR2055.GeraReinfR2055;
var
  wOperacoes, wOperacoesCad: string;
  GeraXML: TGeraXMLReinf;
  wCodR2055, wCodAquisicao, codAquisicao, indProdHomolog: integer;
  periodo: TDateTime;
begin


  if BibSped = nil then
    BibSped := tBibSped.Create;

  wOperacoes := '';
  wOperacoesCad := '';

  if GeraXML = nil then
  GeraXML := TGeraXMLReinf.Create;

  with DMReinf, DMFilial, DMCadastro do
  begin


    // Abre todas as operações cadastradas para que liste todos os cadastros com
    // operações para reinf no período
    QConfigAquisicaoOperacao.Close;
    QConfigAquisicaoOperacao.Open;

    // Busca os cadastros que tem notas nas operações informadas
    QCadastroAquisicao.Close;
    QCadastroAquisicao.SetVariable('FILIAL', Trim(FmFilialReinf.MeFilial.Text));
    QCadastroAquisicao.SetVariable('DATA_INI', Trim(MeDataIniReinf.Text));
    QCadastroAquisicao.SetVariable('DATA_FIM', Trim(MeDataFinReinf.Text));

    QFilial.Close;
    QFilial.SetVariable('PK', Trim(FmFilialReinf.MeFilial.Text));
    QFilial.Open;

    indProdHomolog := QFilialIND_AMBIENTE_REINF.Value;

    QConfigAquisicaoOperacao.First;
    // separa as operações para listar os cadastros
    while not QConfigAquisicaoOperacao.Eof do
    begin
      wOperacoes := wOperacoes + QConfigAquisicaoOperacaoCOD_OPERACAO.Text;

      if (QConfigAquisicaoOperacao.RecNo) < QConfigAquisicaoOperacao.RecordCount then
        wOperacoes := wOperacoes + ', ';

      QConfigAquisicaoOperacao.Next;
    end;

    // Define as operações e abre o dataset para consulta
    QCadastroAquisicao.SetVariable('OPERACAO', wOperacoes);
    QCadastroAquisicao.Open;

    while not QCadastroAquisicao.Eof do
    begin

       // Se houver eventos de aquisição, seta como SIM para gerar o fechamento
       wTem2055 := true;

       if QCadastroAquisicaoIND_CPRB.Text = 'N' then
        begin

          QReinfR2055.Close;
          QReinfR2055.Open;
          QReinfR2055.Insert;

          QReinfR2055IND_RETIFCACAO.Value := 1;
          QReinfR2055DT_PERIODO_APURACAO.Value := BibSped.GetDateInDateTime(StrToDate(MeDataIniReinf.Text));

          QReinfR2055COD_FILIAL.Text := Trim(FmFilialReinf.MeFilial.Text);
          QReinfR2055NUM_CGC_CPF.Value := QCadastroAquisicaoNUM_CGC_CPF.Value;
          QReinfR2055IND_OPCAO_CP.Value :=  QCadastroAquisicaoIND_CPRB.Value;

          QReinfR2055COD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
          wCodR2055 := QReinfR2055COD_REINF_R2055.Value;

          QReinfR2055IND_PRODUCAO_HOMOLOGACAO.Value := indProdHomolog;
          QReinfR2055IND_TIPO_APLICATIVO.Value := 1;

          QReinfR2055.Post;

          for codAquisicao := 1 to 8 do
          begin

            QConfigAquisicaoCons.Close;
            QConfigAquisicaoCons.SetVariable('FILIAL', Trim(FmFilialReinf.MeFilial.Text));
            QConfigAquisicaoCons.SetVariable('AQUISICAO', codAquisicao);
            QConfigAquisicaoCons.Open;

            wOperacoesCad := '';

            while not QConfigAquisicaoCons.Eof do
            begin
              wOperacoesCad := wOperacoesCad + QConfigAquisicaoConsCOD_OPERACAO.Text;

              if (QConfigAquisicaoCons.RecNo) < QConfigAquisicaoCons.RecordCount then
                wOperacoesCad := wOperacoesCad + ', ';

              QConfigAquisicaoCons.Next;
            end;

            if (wOperacoesCad <> '') then
            begin
              QAquisicaoGeracao.Close;
              QAquisicaoGeracao.SetVariable('DATA_INI', Trim(MeDataIniReinf.Text));
              QAquisicaoGeracao.SetVariable('DATA_FIM', Trim(MeDataFinReinf.Text));
              QAquisicaoGeracao.SetVariable('NUM_CGC_CPF', QCadastroAquisicaoNUM_CGC_CPF.Value);
              QAquisicaoGeracao.SetVariable('OPERACAO', wOperacoesCad);
              QAquisicaoGeracao.Open;

              if (not QAquisicaoGeracao.eof) then
              begin
                QAquisicaoR2055.Open;
                QAquisicaoR2055.Insert;
                QAquisicaoR2055COD_TABELA_REINF.Value := 'R-2055';
                QAquisicaoR2055COD_REGISTRO_REINF.Value := wCodR2055;
                QAquisicaoR2055IND_AQUISICAO.Value := QAquisicaoGeracaoIND_AQUISICAO.Value;
                QAquisicaoR2055VAL_BRUTO.Value := QAquisicaoGeracaoVAL_TOTAL.Value;
                QAquisicaoR2055VAL_CP_DESC_PR.Value := QAquisicaoGeracaoINSS.Value;
                QAquisicaoR2055VAL_RAT_DESC_PR.Value := QAquisicaoGeracaoRAT.Value;
                QAquisicaoR2055VAL_SENAR_DESC.Value := QAquisicaoGeracaoSENAR.Value;
                QAquisicaoR2055.Post;
              end;
            end;
          end;
        end;
        GeraXML.GerarR2055(wCodR2055, 'R-2055', QCadastroAquisicaoDESC_VERSAO_REINF.Value);

        QCadastroAquisicao.Next;
      end;
  end;

end;

procedure TFGeraR2055.GeraReinfR2099(tem2010, tem2020, tem2030, tem2040, tem2050, tem2055, tem2060, temPagamento: boolean);
var
  GeraXML: TGeraXMLReinf;
  wCodR2099: integer;
  periodo: TDateTime;
begin

  if BibSped = nil then
    BibSped := tBibSped.Create;

  with DMFilial, DMReinf, DMUsuario, DMOracle do
  begin

    // Abre query do fechamento do período para setar as informações e gerar o XML.
    QReinfR2099.Close;
    QReinfR2099.Open;

    QReinfR2099.Insert;

    QFilial.Close;
    QFilial.SetVariable('PK', StrToInt(Trim(FmFilialReinf.MeFilial.Text)));
    QFilial.Open;



    QReinfR2099COD_FILIAL.Value := QFilialCOD_FILIAL.Value;
    QReinfR2099COD_CADASTRO.Value := QFilialCOD_CADASTRO_REINF.Value;
    QReinfR2099IND_RETIFCACAO.Value := 0;
    QReinfR2099DT_PERIODO_APURACAO.Value := BibSped.GetDateInDateTime(StrToDate(MeDataIniReinf.Text));
    QReinfR2099IND_PRODUCAO_HOMOLOGACAO.Value := QFilialIND_AMBIENTE_REINF.Value;
    QReinfR2099IND_TIPO_APLICATIVO.Value := 1; // 1 - Aplicativo do Contribuinte | 2 - Governamental
    QReinfR2099IND_EVT_R2010.Value := IfThen(tem2010, 'S', 'N');
    QReinfR2099IND_EVT_R2020.Value := IfThen(tem2020, 'S', 'N');
    QReinfR2099IND_EVT_R2030.Value := IfThen(tem2030, 'S', 'N');
    QReinfR2099IND_EVT_R2040.Value := IfThen(tem2040, 'S', 'N');
    QReinfR2099IND_EVT_R2050.Value := IfThen(tem2050, 'S', 'N');
    QReinfR2099IND_EVT_R2055.Value := IfThen(tem2055, 'S', 'N');
    QReinfR2099IND_EVT_R2060.Value := IfThen(tem2060, 'S', 'N');
    QReinfR2099IND_EVT_PAGAMENTOS.Value := IfThen(temPagamento, 'S', 'N');
    QReinfR2099COD_USUARIO.Value := DMUSuario.CodUsuarioCorrente;

    wCodR2099 := QReinfR2099COD_REINF_R2099.Value;

    QReinfR2099.Post;

    GeraXML.GerarR2099(wCodR2099, 'R-2099', QFilialDESC_VERSAO_REINF.Value);

  end;

end;

procedure TFGeraR2055.Gerar;
begin

  wTem2010 := false;
  wTem2020 := false;
  wTem2030 := false;
  wTem2040 := false;
  wTem2050 := false;
  wTem2055 := false;
  wTem2060 := false;
  wTemPagamento := false;

  with DMReinf do
  begin
    QAquisicaoGeracao.Close;

    if Trim(FmFilialReinf.MeFilial.Text) <> '' then
      QAquisicaoGeracao.SetVariable('FILIAL', Trim(FmFilialReinf.MeFilial.Text))
    else
      Raise Exception.Create('A Filial é obrigatória');

    if Trim(MeDataIniReinf.Text) <> '' then
      QAquisicaoGeracao.SetVariable('DATA_INI', Trim(MeDataIniReinf.Text))
    else
      Raise Exception.Create('A Data Inicial é obrigatória');

    if Trim(MeDataFinReinf.Text) <> '' then
      QAquisicaoGeracao.SetVariable('DATA_FIM', Trim(MeDataFinReinf.Text))
    else
      Raise Exception.Create('A Data Final é obrigatória');


    QReinfPeriodo.Close;
    QReinfPeriodo.SetVariable('dt_inicio_evento', Trim(MeDataIniReinf.Text));
    QReinfPeriodo.SetVariable('dt_fim_evento', Trim(MeDataFinReinf.Text));
    QReinfPeriodo.Open;
    //if not QReinfPeriodo.Eof then
      //Raise Exception.Create('O intervalo utilizado já foi gerado. Por favor, entre em contato com o suporte.');

    QReinfPeriodo.Close;
    QReinfPeriodo.ClearVariables;
    QReinfPeriodo.Open;

    //Removida esta geração devido a Contabilidade da Grasel já ter realizado o envio da abertura
    //GeraReinfR1000;
    GeraReinfR2055;

    //Devido ao tempo para enviar os eventos, a geração do fechamento foi modificada para ser transmitida de forma independente
    //GeraReinfR2099(wTem2010, wTem2020, wTem2030, wTem2040, wTem2050, wTem2055, wTem2060, wTemPagamento);

  end;


end;

procedure TFGeraR2055.EncerrarMes;
begin
  wTem2010 := false;
  wTem2020 := false;
  wTem2030 := false;
  wTem2040 := false;
  wTem2050 := false;
  wTem2055 := false;
  wTem2060 := false;
  wTemPagamento := false;

  with DMReinf do
  begin

    QGeraR2099.Close;

    if Trim(MeDataIniReinf.Text) <> '' then
      QGeraR2099.SetVariable('DT_INI_EVENTO', Trim(MeDataIniReinf.Text))
    else
      Raise Exception.Create('A Data Inicial é obrigatória para o fechamento');

    QGeraR2099.Open;

    while not QGeraR2099.Eof do
    begin
      if QGeraR2099DESC_EVENTO_REINF.Value = 'R-2010' then
        wTem2010 := true;

      if QGeraR2099DESC_EVENTO_REINF.Value = 'R-2020' then
        wTem2020 := true;

      if QGeraR2099DESC_EVENTO_REINF.Value = 'R-2030' then
        wTem2030 := true;

      if QGeraR2099DESC_EVENTO_REINF.Value = 'R-2040' then
        wTem2040 := true;

      if QGeraR2099DESC_EVENTO_REINF.Value = 'R-2050' then
        wTem2050 := true;

      if QGeraR2099DESC_EVENTO_REINF.Value = 'R-2055' then
        wTem2055 := true;

      if QGeraR2099DESC_EVENTO_REINF.Value = 'R-2060' then
        wTem2060 := true;

      QGeraR2099.Next;
    end;

  end;

  GeraReinfR2099(wTem2010, wTem2020, wTem2030, wTem2040, wTem2050, wTem2055, wTem2060, wTemPagamento);

end;

end.
