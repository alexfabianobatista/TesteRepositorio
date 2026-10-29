unit UContasReceberVoltaBaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Grids, DBGrids, ComCtrls, OracleData, OraTeste;

type
  TFContasReceberVoltaBaixa = class(TForm)
    PCBaixa: TPageControl;
    TS0Localiza: TTabSheet;
    GroupBox1: TGroupBox;
    Fornecedor: TLabel;
    DBGrid1: TDBGrid;
    METexto: TMaskEdit;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    MEDataVencInicial: TMaskEdit;
    MEDataVencFinal: TMaskEdit;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    MEDataEmissaoInicial: TMaskEdit;
    MEDataEmissaoFinal: TMaskEdit;
    MECodCliente: TMaskEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    MeNumTitulo: TMaskEdit;
    Label18: TLabel;
    SbProcura: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MECodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MECodClienteExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContasReceberVoltaBaixa: TFContasReceberVoltaBaixa;

implementation

uses UContasReceber_cl, UOracle_cl, UPlanilha_cl, UContasPagar_cl,
  UMoeda_cl, UParamSistema_cl, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFContasReceberVoltaBaixa.BitBtn2Click(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= DMContasReceber.QContasReceberBaixaMovDt_Movimento.Value Then
     Raise Exception.Create('Não é Permitido Voltar Confirmação - Fechamento Contabil');
  with DMContasReceber do
    begin
      if (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value <> 'PRINCIPAL') Then
        begin
          if not(DMOracle.DBCemapa.InTransaction) then
            DMOracle.DBCemapa.StartTransaction;
          Try
            If (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value <> 'JUROS') Then
            Begin
              DMOracle.Audit( TOracleDataset1 (DMContasReceber.QContasReceber_Cab ), 'Volta Baixa' );
              DMPlanilha.Descontabiliza(DMContasReceber.QContasReceberBaixaMovCod_Lancto_contabil_Cred.Value,'CR_CP_MOV');
              DMPlanilha.Descontabiliza(DMContasReceber.QContasReceberBaixaMovCod_Lancto_contabil_Deb.Value,'CR_CP_MOV');
              DMContasPagar.QVoltaMovBanco.SetVariable('COD_BCO_MOVIMENTO',DMContasReceber.QContasReceberBaixaMovCod_Bco_Movimento.Value);
              DMContasPagar.QVoltaMovBanco.ExecSQL;
              DMContasPagar.QVoltaMovCaixa.SetVariable('COD_CAIXA_MOV',DMContasReceber.QContasReceberBaixaMovCod_Caixa_Mov.Value);
              DMContasPagar.QVoltaMovCaixa.ExecSQL;
            End;
            QContasReceber_Cab.Close;
            QContasReceber_Cab.SetVariable('PK',QContasReceberBaixaCod_Conta_Receber_Cab.Value);
            QContasReceber_Cab.Open;
            QContasReceber_Cab.Edit;
            If (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value = 'RECEBTO. PRINCIPAL') then
              QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value+QContasReceberBaixaMovVal_Movimento.Value
            else
              if (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value = 'RECEBTO. JUROS') And (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO') Then
                 QContasReceber_CabVal_Juros.Value:=QContasReceber_CabVal_Juros.Value+QContasReceberBaixaMovVal_Movimento.Value
              else
                if (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value = 'DESC. CONCEDIDO') then
                   QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value+QContasReceberBaixaMovVal_Movimento.Value
                Else
{                  If (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value = 'JUROS')  Then
                     QContasReceber_CabVal_Juros.Value:=QContasReceber_CabVal_Juros.Value-QContasReceberBaixaMovVal_Movimento.Value
                  Else   }
                    if (QContasReceberBaixaMovIND_TIPO_MOVIMENTO.Value = 'DEVOLUCAO') then
                       QContasReceber_CabVal_Titulo.Value:=QContasReceber_CabVal_Titulo.Value+QContasReceberBaixaMovVal_Movimento.Value;

            QContasReceberBaixaMov.Delete;

           // Muda a Situção do Título
            If QContasReceber_CabVal_Titulo.Value=QContasReceber_CabVal_Original.Value then
              Begin
                QContasReceber_CabDT_Baixa.Clear;
                QContasReceber_CabInd_Situacao.Value:='ABERTO';
                QContasReceber_CabVal_Juros.Value := 0; // na rotina before post volta a data de capitalizacao para a data de vencto
              End
            Else
              If ((QContasReceber_CabVal_Titulo.Value < QContasReceber_CabVal_Original.Value)) and (QContasReceber_CabVal_Titulo.Value <> 0) then
                 QContasReceber_CabInd_Situacao.Value:='BAIXA PARCIAL';

            QContasReceber_Cab.post;
            DMOracle.DBCemapa.Commit;
          except
            DMOracle.DBCemapa.Rollback;
            raise Exception.Create('Não foi possível voltar este lançamento');
          end;
         QContasReceberBaixaMov.Close;
         QContasReceberBaixa.Close;
         QContasReceberBaixa.Open;
         QContasReceberBaixaMov.Open;
         ShowMessage('Lançamento Excluído.');
        end
      Else
        ShowMessage('Não é possível Voltar o Movimento Principal ou Juros');
    end;
end;

procedure TFContasReceberVoltaBaixa.BitBtn1Click(Sender: TObject);
begin
  if FCadastrocons = Nil then
    FCadastrocons:=TFCadastrocons.Create(Application);
  If FCadastrocons.ShowModal=MrOk then
    begin
      MECodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    end;
end;

procedure TFContasReceberVoltaBaixa.FormActivate(Sender: TObject);
begin
  DMContasReceber.QContasReceberBaixaMov.Close;
  DMContasReceber.QContasReceberBaixa.Close;
  MECodCliente.SetFocus;
end;

procedure TFContasReceberVoltaBaixa.MECodClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 123 then //123 --> F3
    BitBtn1.Click;
end;

procedure TFContasReceberVoltaBaixa.MECodClienteExit(Sender: TObject);
begin
  if Trim(MECodCliente.Text) <> '' then
    MEtexto.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCliente.text)
  else
    MEtexto.Clear;

end;

procedure TFContasReceberVoltaBaixa.BitBtn3Click(Sender: TObject);
var wdata_teste:TDate;
begin
    With DMContasReceber do
      Begin
        QContasReceberBaixa.Close;
        QContasReceberBaixa.Sql.Clear;
        QContasReceberBaixa.Sql.Add('SELECT TB_CADASTRO."NOME" ,TB_CONTA_RECEBER_CAB."COD_CONTA_RECEBER_CAB" , TB_CONTA_RECEBER_CAB."COD_FINALIDADE" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."COD_BANCO_AGENCIA" ,TB_CONTA_RECEBER_CAB."COD_CADASTRO" , TB_CONTA_RECEBER_CAB."COD_FILIAL", TB_FILIAL."DESC_FILIAL" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."COD_DEPARTAMENTO" ,TB_CONTA_RECEBER_CAB."NUM_TITULO" ,TB_CONTA_RECEBER_CAB."NUM_PARCELA" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."DESC_TIPO_DOCUMENTO" ,TB_CONTA_RECEBER_CAB."DT_MOVIMENTO" ,TB_CONTA_RECEBER_CAB."DT_BAIXA" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."DT_VENCIMENTO" ,TB_CONTA_RECEBER_CAB."DT_EMISSAO" ,TB_CONTA_RECEBER_CAB."DT_CAPITALIZACAO" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."DT_CAPITALIZACAO_MOEDA" ,TB_CONTA_RECEBER_CAB."VAL_TITULO" ,TB_CONTA_RECEBER_CAB."COD_NOTA_CAB" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."DESC_OBSERVACAO" ,TB_CONTA_RECEBER_CAB."IND_ACEITE" ,TB_CONTA_RECEBER_CAB."IND_SITUACAO" ,');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB."VAL_ORIGINAL",TB_CONTA_RECEBER_CAB."VAL_JUROS",TB_CONTA_RECEBER_CAB."COD_ORDEM_COMPRA_CAB",TB_CLASS_CADASTRO.DESC_CLASSIFICACAO, ');
        QContasReceberBaixa.Sql.Add('TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA,TB_FINALIDADE.COD_HISTORICO_DESC,TB_FINALIDADE.DESC_FINALIDADE, TB_FINALIDADE.PERC_JURO_MORA, ');
        QContasReceberBaixa.Sql.Add('DECODE(Tb_conta_receber_cab.IND_SITUACAO,'+Chr(39)+'ABERTO'+Chr(39)+',TB_FINALIDADE.NUM_DIAS_CARENCIA,0) AS NUM_DIAS_CARENCIA ');
        QContasReceberBaixa.Sql.Add('FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_CLASS_CADASTRO,TB_FINALIDADE, TB_FILIAL WHERE ');
        QContasReceberBaixa.Sql.Add('TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO');
        QContasReceberBaixa.Sql.Add(' AND TB_CADASTRO.COD_CLASS_CADASTRO = TB_CLASS_CADASTRO.COD_CLASS_CADASTRO');
        QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALIDADE');
        QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL');
        If Trim(MECodCliente.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CADASTRO.COD_CADASTRO = ' + Trim(MECodCliente.Text));
        If Trim(MeNumTitulo.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.NUM_TITULO = ' + Trim(MeNumTitulo.Text));
        If Trim(MEDataEmissaoInicial.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO >= ' + chr(39) + Trim(MEDataEmissaoInicial.Text) + chr(39));
        If Trim(MEDataEmissaoFinal.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO <= ' + chr(39) + Trim(MEDataEmissaoFinal.Text) + chr(39));
        If Trim(MEDataVencInicial.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' + chr(39) + Trim(MEDataVencInicial.Text) + chr(39));
        If Trim(MEDataVencFinal.Text) <> '' then
           QContasReceberBaixa.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' + chr(39) + Trim(MEDataVencFinal.Text) + chr(39));
      QContasReceberBaixa.Open;
      QContasReceberBaixaMov.Open;
   End;
end;

end.
