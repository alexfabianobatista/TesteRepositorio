unit UContrato_Vend_Confirma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Mask;

type
  TFContrato_Vend_Confirma = class(TForm)
    GBCR: TGroupBox;
    GBCP: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MECRCodFinalidade: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MECRFinalidade: TMaskEdit;
    MECRDepartamento: TMaskEdit;
    MECRBanco: TMaskEdit;
    MECRCodDepartamento: TMaskEdit;
    MECRCodBanco: TMaskEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton4: TSpeedButton;
    MECPFinalidade: TMaskEdit;
    Label5: TLabel;
    SpeedButton5: TSpeedButton;
    MECPDepartamento: TMaskEdit;
    Label6: TLabel;
    SpeedButton6: TSpeedButton;
    MECPBanco: TMaskEdit;
    MECPCodFinalidade: TMaskEdit;
    MECPCodDepartamento: TMaskEdit;
    MECPCodBanco: TMaskEdit;
    DBGrid1: TDBGrid;
    MEValorComissao: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    MeDtEmissao: TMaskEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECRCodFinalidadeExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECRCodDepartamentoExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MECRCodBancoExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MECPCodFinalidadeExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure MECPCodDepartamentoExit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure MECPCodBancoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure GeraCP_CR(S:String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContrato_Vend_Confirma: TFContrato_Vend_Confirma;

implementation

uses Ucontrato_cl, UFinalidadeCons, UFinalidade_cl, UOracle_cl,
  UDepartamento_cl, UDepartamentoCons, UBancosCons, UBancoAgencia_cl,
  UContasPagar_cl, UBiblioteca, UContasReceber_cl, UOperacao_cl,
  UPlanilha_cl;

{$R *.DFM}

procedure TFContrato_Vend_Confirma.SpeedButton1Click(Sender: TObject);
begin
  if FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk then
    begin
      MECRCodFinalidade.Text:=DMFinalidade.QFinalidadeConsCod_Finalidade.text;
      MECRCodFinalidadeExit(Self);
    end;
end;

procedure TFContrato_Vend_Confirma.MECRCodFinalidadeExit(Sender: TObject);
begin
  if Trim(MECRCodFinalidade.text) <> '' then
    MECRFinalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MECRCodFinalidade.Text)
  else
    MECRFinalidade.Clear;
end;

procedure TFContrato_Vend_Confirma.SpeedButton2Click(Sender: TObject);
begin
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
    begin
      MECRCodDepartamento.text:=DMDepartamento.QDepartamentoConsCod_Departamento.text;
      MECRCodDepartamentoExit(Self);
    end;
end;

procedure TFContrato_Vend_Confirma.MECRCodDepartamentoExit(
  Sender: TObject);
begin
  if Trim(MECRCodDepartamento.text)<>'' then
    MECRDepartamento.text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MECRCodDepartamento.text)
  else
    MECRDepartamento.clear;
end;

procedure TFContrato_Vend_Confirma.SpeedButton3Click(Sender: TObject);
begin
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk then
    begin
      MECRCodBanco.text:=DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
      MECRCodBancoExit(Self);
    end;
end;

procedure TFContrato_Vend_Confirma.MECRCodBancoExit(Sender: TObject);
begin
  if trim(MECRCodBanco.text)<>'' then
    MECRBanco.text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MECRCodBanco.text)
  else
    MECRBanco.Clear;
end;

procedure TFContrato_Vend_Confirma.SpeedButton4Click(Sender: TObject);
begin
  if FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk then
    begin
      MECPCodFinalidade.Text:=DMFinalidade.QFinalidadeConsCod_Finalidade.text;
      MECPCodFinalidadeExit(Self);
    end;
end;

procedure TFContrato_Vend_Confirma.MECPCodFinalidadeExit(Sender: TObject);
begin
  if Trim(MECPCodFinalidade.text) <> '' then
    MECPFinalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MECPCodFinalidade.Text)
  else
    MECPFinalidade.Clear;
end;

procedure TFContrato_Vend_Confirma.SpeedButton5Click(Sender: TObject);
begin
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
    begin
      MECPCodDepartamento.text:=DMDepartamento.QDepartamentoConsCod_Departamento.text;
      MECPCodDepartamentoExit(Self);
    end;
end;

procedure TFContrato_Vend_Confirma.MECPCodDepartamentoExit(
  Sender: TObject);
begin
  if Trim(MECPCodDepartamento.text)<>'' then
    MECPDepartamento.text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MECPCodDepartamento.text)
  else
    MECPDepartamento.clear;
end;

procedure TFContrato_Vend_Confirma.SpeedButton6Click(Sender: TObject);
begin
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk then
    begin
      MECPCodBanco.text:=DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Text;
      MECPCodBancoExit(Self);
    end;
end;

procedure TFContrato_Vend_Confirma.MECPCodBancoExit(Sender: TObject);
begin
  if trim(MECPCodBanco.text)<>'' then
    MECPBanco.text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MECPCodBanco.text)
  else
    MECPBanco.Clear;
end;

procedure TFContrato_Vend_Confirma.BitBtn1Click(Sender: TObject);
Var wNome,wValor : String;
begin
  If StrToDate(MeDtEmissao.Text) < DMContrato.QContrato_VendDt_Contrato.Value Then
     Raise Exception.Create('Data de emissão não pode ser menor que data do contrato');
      
  with DMContrato do
    begin
      try
        if not(DMOracle.DBCemapa.inTransaction) then
          DMOracle.DBCemapa.StartTransaction;
        DMContasPagar.QContasPagar_Cab.Open;
        DMContasPagar.QContasPagar_Mov.Open;
        DMContasReceber.QContasReceber_Cab.Open;
        DMContasReceber.QContasReceber_Mov.Open;
        if Trim(MEValorComissao.Text) <> '' then
          GeraCP_CR('CP');
        GeraCP_CR('CR');
        DMContasPagar.QContasPagar_Cab.Close;
        DMContasPagar.QContasPagar_Mov.Close;
        DMContasReceber.QContasReceber_Cab.Close;
        DMContasReceber.QContasReceber_Mov.Close;
        QContrato_Vend.Edit;
        QContrato_VendIND_CONF.value:='S';
        QContrato_vend.Post;

        wNome := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QContrato_VendCod_Cadastro.Text);
        wValor := DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) FROM TB_CONTA_RECEBER_CAB','COD_CONTRATO_VEND = '+QContrato_VendCod_Contrato_vend.Text);
        DMOperacao.QOperacao.Close;
        DMOperacao.QOperacao.SetVariable('Pk',QContrato_VendCod_Operacao_Inclusao.Value);
        DMOperacao.QOperacao.Open;
        If Not(DMOperacao.QOperacao.Eof) Then
        Begin
          DMPlanilha.GravaLanc('CVENDA',
                               QContrato_VendCOD_CONTRATO_VEND.Value,
                               FloatToStr(QContrato_VendNUM_CONTRATO.Value)+'-'+wNome,
                               QContrato_VendCod_Filial.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_DEB.Value,
                               'DEBITO',
                               QContrato_VendCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                               StrToFloat(wValor),
                               QContrato_VendDt_Contrato.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_CRED.Value);
          DMPlanilha.GravaLanc('CVENDA',
                               QContrato_VendCOD_CONTRATO_VEND.Value,
                               FloatToStr(QContrato_VendNUM_CONTRATO.Value)+'-'+wNome,
                               QContrato_VendCod_Filial.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_CRED.Value,
                               'CREDITO',
                               QContrato_VendCod_Cadastro.Value,
                               DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                               StrToFloat(wValor),
                               QContrato_VendDt_Contrato.Value,
                               DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_DEB.Value);
        End;
        DMOracle.DBCemapa.Commit;
        ShowMessage('Movimentos gerados com Sucesso.');
      except
        DMContasPagar.QContasPagar_Cab.Cancel;
        DMContasReceber.QContasReceber_cab.Cancel;
        QContrato_Vend.Cancel;
        DMOracle.DBCemapa.RollBack;
        Raise Exception.Create('Erro! Não foi possível gerar o Contas a Pagar ou Contas a Receber.');
      end;
    end;
end;

procedure TFContrato_Vend_Confirma.GeraCP_CR(S: String);
var Parc:Integer;
    wCodigo : String;
begin
  with DMContrato do
    begin
      if S='CP'then
        begin
          with DMContasPagar do
            begin
              QContasPagar_Cab.Insert;
              if Trim(MECPCodFinalidade.text)<>'' then
                QContasPagar_CabCOD_FINALIDADE.Value:=StrToInt(MECPCodFinalidade.text);
              if Trim(MECPCodBanco.text)<>'' then
                QContasPagar_CabCOD_BANCO_AGENCIA.Value := StrToInt(MECPCodBanco.text);
              if Trim(MECPCodDepartamento.text)<>'' then
                QContasPagar_CabCOD_DEPARTAMENTO.Value := StrToInt(MECPCodDepartamento.text);
              QContasPagar_CabCOD_CADASTRO.Value:=StrToInt(QContrato_VendCOD_CORRETORA.Text);
              QContasPagar_CabCOD_FILIAL.Value:=StrToInt(QContrato_VendCOD_FILIAL.Text);
              QContasPagar_CabDESC_TIPO_DOCUMENTO.Value:='CNV';
              QContasPagar_CabDT_VENCIMENTO.Value:=QContrato_VendDT_PAGTO.value;
              QContasPagar_CabDT_EMISSAO.Value:=StrToDate(MeDtEmissao.Text);
              QContasPagar_CabVAL_TITULO.Value:=StrToFloat(Bib.LimpaString(MEValorComissao.text,'.'));
              QContasPagar_CabIND_ACEITE.Value:='NAO';
              QContasPagar_CabIND_SITUACAO.Value:='ABERTO';
              QContasPagar_CabCOD_CONTRATO_VEND.Value:=StrToInt(QContrato_VendCod_Contrato_Vend.Text);
              QContasPagar_CabDESC_OBSERVACAO.Value:='Referente ao contrato nr.'+DMCOntrato.QContrato_VendNum_Contrato.Text;
              QContasPagar_Cab.Post;
            end;
        end
      else
        begin
          with DMContasReceber do
            begin
              QContrato_Vend_Pagto.First;
              Parc:=1;
              while not(QContrato_Vend_Pagto.Eof) do
                begin
                  wCodigo := DMOracle.Buscanome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB','COD_FILIAL ='+FloatToStr(Trunc(QContrato_VendCod_Filial.Value)) +
                                                ' AND COD_CADASTRO = ' + FloatToStr(Trunc(QContrato_VendCOD_CADASTRO.Value)) +
                                                ' AND NUM_TITULO = ' + FloatToStr(Trunc(QContrato_VendNUM_CONTRATO.Value)) +
                                                ' AND NUM_PARCELA = ' + FloatToStr(Parc) +
                                                ' AND DESC_TIPO_DOCUMENTO = ' + Chr(39) + 'CNV' + Chr(39));
                  If Trim(wCodigo) = '' Then
                    Begin
                      QContasReceber_Cab.Insert;
                      if Trim(MECRCodFinalidade.text)<>'' then
                        QContasReceber_CabCOD_FINALIDADE.Value:=StrToInt(Trim(MECRCodFinalidade.text));
                      if Trim(MECRDepartamento.text)<>'' then
                        QContasReceber_CabCOD_DEPARTAMENTO.Value:=StrToInt(trim(MECRCodDepartamento.text));
                      if Trim(MECRBanco.text)<>'' then
                        QContasReceber_CabCOD_BANCO_AGENCIA.Value:=StrToInt(Trim(MECRCodBanco.text));
                      QContasReceber_CabCOD_FILIAL.Value:=Trunc(QContrato_VendCod_Filial.Value);
                      QContasReceber_CabNUM_TITULO.Value:=Trunc(QContrato_VendNUM_CONTRATO.Value);
                      QContasReceber_CabNUM_PARCELA.Value:=Parc;
                      QContasReceber_CabDESC_TIPO_DOCUMENTO.Value:='CNV';
                      QContasReceber_CabDt_Emissao.Value := StrToDate(MeDtEmissao.Text);
                      QContasReceber_CabDT_VENCIMENTO.Value:=QContrato_Vend_PagtoDT_PAGTO.Value;
                      QContasReceber_CabVAL_TITULO.Value:=QContrato_Vend_PagtoVAL_PAGTO.Value;
                      QContasReceber_CabCOD_CADASTRO.Value:=Trunc(QContrato_VendCOD_CADASTRO.Value);
                      QContasReceber_CabPERC_COMISSAO1.Value := 0;
                      QContasReceber_CabCOD_CONTRATO_VEND.Value:=Trunc(QContrato_VendCOD_CONTRATO_VEND.value);
                      QContasreceber_CabDESC_OBSERVACAO.Value:='Referente ao contrato nr.'+DMCOntrato.QContrato_vendNum_Contrato.Text;
                      QContasReceber_Cab.Post;
                    End;
                  QContrato_Vend_Pagto.Next;
                  Inc(Parc);
                end;
            end;
        end;
    end;
end;

end.
