unit UAuditoriaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmDatas, ExtCtrls, ImgList;

type
  TFAuditoriaCons = class(TFTConsulta)
    RGTelas: TRadioGroup;
    FmDatas1: TFmDatas;
    RgOperacao: TRadioGroup;
    MeChavePrimaria: TMaskEdit;
    Label2: TLabel;
    MeUsuario: TMaskEdit;
    Label3: TLabel;
    ILBotao: TImageList;
    MMCadSimples: TMainMenu;
    Manuteno1: TMenuItem;
    Sair2: TMenuItem;
    Relatrios1: TMenuItem;
    PorDatadeAcesso1: TMenuItem;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PorDatadeAcesso1Click(Sender: TObject);
  private
    { Private declarations }
    procedure WMMouseWheel(var Msg: TWMMouseWheel); message WM_MOUSEWHEEL;
  public
    { Public declarations }
  end;

var
  FAuditoriaCons: TFAuditoriaCons;

implementation

uses UAditoria_cl, URConfereBaixaContaReceber, UConsultaAuditoriaParam,
  DateUtils, Math;

{$R *.dfm}

procedure TFAuditoriaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  //if FAuditoriaCons.ShowModal = mrOK then
  with DMAuditoria do
  Begin
    QAuditoriaCons.Close;
    Case FAuditoriaCons.RGTelas.ItemIndex of
      0: QAuditoriaCons.SetVariable('DESC_TABELA','TB_CAIXA_MOV');
      1: QAuditoriaCons.SetVariable('DESC_TABELA','TB_CADASTRO');
      2: QAuditoriaCons.SetVariable('DESC_TABELA','TB_NOTA_CAB');
      3: QAuditoriaCons.SetVariable('DESC_TABELA','TB_PEDIDO_CAB');
      4: QAuditoriaCons.SetVariable('DESC_TABELA','TB_PRODUTO');
      5: QAuditoriaCons.SetVariable('DESC_TABELA','TB_BANCO_AGENCIA');
      6: QAuditoriaCons.SetVariable('DESC_TABELA','TB_CLASSE');
      7: QAuditoriaCons.SetVariable('DESC_TABELA','TB_CONTA_CORRENTE');
      8: QAuditoriaCons.SetVariable('DESC_TABELA','TB_CONTA_PAGAR_CAB');
      9: QAuditoriaCons.SetVariable('DESC_TABELA','TB_CONTA_RECEBER_CAB');
      10: QAuditoriaCons.SetVariable('DESC_TABELA','TB_FINALIDADE');
      11: QAuditoriaCons.SetVariable('DESC_TABELA','TB_HISTORICO');
      12: QAuditoriaCons.SetVariable('DESC_TABELA','TB_LANCTO_CONTABIL');
      13: QAuditoriaCons.SetVariable('DESC_TABELA','TB_OPERACAO');
      14: QAuditoriaCons.SetVariable('DESC_TABELA','TB_ORDEM_COMPRA_CAB');
      15: QAuditoriaCons.SetVariable('DESC_TABELA','TB_ORDEM_SERVICO_CAB');
      16: QAuditoriaCons.SetVariable('DESC_TABELA','TB_PLANO_CONTAS');
      17: QAuditoriaCons.SetVariable('DESC_TABELA','TB_SERIE');
      18: QAuditoriaCons.SetVariable('DESC_TABELA','TB_TRIBUTACAO');
      19: QAuditoriaCons.SetVariable('DESC_TABELA',NULL);
    end;
    Case FAuditoriaCons.RGTelas.ItemIndex of
      0: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_CAIXA_MOV');
      1: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_CADASTRO');
      2: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_NOTA_ITEM');
      3: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_PEDIDO_ITEM');
      4: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_PRODUTO');
      5: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_BANCO_AGENCIA');
      6: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_CLASSE');
      7: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_CONTA_CORRENTE');
      8: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_CONTA_PAGAR_MOV');
      9: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_CONTA_RECEBER_MOV');
      10: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_FINALIDADE');
      11: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_HISTORICO');
      12: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_LANCTO_CONTABIL');
      13: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_OPERACAO');
      14: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_ORDEM_COMPRA_CAB');
      15: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_ORDEM_SERVICO_ITEM');
      16: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_PLANO_CONTAS');
      17: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_SERIE');
      18: QAuditoriaCons.SetVariable('DESC_TABELA1','TB_TRIBUTACAO');
      19: QAuditoriaCons.SetVariable('DESC_TABELA1',NULL);
    end;
    If FAuditoriaCons.FmDatas1.MeDtInicial.Text <> '' then
      QAuditoriaCons.SetVariable('DT_INICIAL',FAuditoriaCons.FmDatas1.MeDtInicial.text)
    else
      Raise Exception.Create('Obrigatório informar o período!');
    if FAuditoriaCons.FmDatas1.MeDtFinal.Text <> '' then
      QAuditoriaCons.SetVariable('DT_FINAL',FAuditoriaCons.FmDatas1.MeDtFinal.text)
    else
      Raise Exception.Create('Obrigatório informar o período!');
    case FAuditoriaCons.RgOperacao.ItemIndex of
      0 : QAuditoriaCons.SetVariable('OPERACAO','ALTERADO');
      1 : QAuditoriaCons.SetVariable('OPERACAO','EXCLUIDO');
      2 : QAuditoriaCons.SetVariable('OPERACAO','CADASTRADO');
      3 : QAuditoriaCons.SetVariable('OPERACAO',null);
    end;
    If Trim(FAuditoriaCons.MeChavePrimaria.Text) <> '' then
      QAuditoriaCons.SetVariable('COD_CHAVE_PRIMARIA',Trim(FAuditoriaCons.MeChavePrimaria.Text))
    else
      QAuditoriaCons.SetVariable('COD_CHAVE_PRIMARIA', NULL);
    If Trim(FAuditoriaCons.MeUsuario.Text) <> '' then
      QAuditoriaCons.SetVariable('COD_USUARIO', Trim(FAuditoriaCons.MeUsuario.Text))
    else
      QAuditoriaCons.SetVariable('COD_USUARIO', NULL);
    if Trim(UpperCase(FAuditoriaCons.METexto.Text)) <> '' then
      QAuditoriaCons.SetVariable('DESC_NOME_CAMPO',Trim(UpperCase(FAuditoriaCons.METexto.Text)))
    else
      QAuditoriaCons.SetVariable('DESC_NOME_CAMPO',null);

    QAuditoriaCons.Open;
  end;
end;

procedure TFAuditoriaCons.FormCreate(Sender: TObject);
begin
  inherited;
  FmDatas1.MeDtInicial.Text := DateToStr(Date);
  FmDatas1.MeDtFinal.Text := DateToStr(Date);
end;

procedure TFAuditoriaCons.PorDatadeAcesso1Click(Sender: TObject);
begin
  inherited;
  if FConsultaAuditoriaParam = Nil then
    FConsultaAuditoriaParam := TFConsultaAuditoriaParam.Create(Application);
  FConsultaAuditoriaParam.PGRelatorio.Pages[0].TabVisible := True;
  FConsultaAuditoriaParam.FmDatas1.MeDtInicial.Text := DateToStr(Now-15);
  FConsultaAuditoriaParam.FmDatas1.MeDtFinal.Text := DateToStr(Now);
  If FConsultaAuditoriaParam.ShowModal =  mrOk then
  begin
    with DMAuditoria do
    begin
      QRConfereBaixaCr.Close;
      if Trim(FConsultaAuditoriaParam.MeUsuario.Text) <> '' then
        QRConfereBaixaCr.SetVariable('COD_USUARIO',Trim(FConsultaAuditoriaParam.MeUsuario.Text))
      else
        QRConfereBaixaCr.SetVariable('COD_USUARIO', null);
      if FConsultaAuditoriaParam.FmDatas1.MeDtInicial.Text <> '' then
        QRConfereBaixaCr.SetVariable('DT_MOVIMENTO_INI',FConsultaAuditoriaParam.FmDatas1.MeDtInicial.Text)
      else
        QRConfereBaixaCr.SetVariable('DT_MOVIMENTO_INI',null);
      if FConsultaAuditoriaParam.FmDatas1.MeDtFinal.Text <> '' then
        QRConfereBaixaCr.SetVariable('DT_MOVIMENTO_FIM',FConsultaAuditoriaParam.FmDatas1.MeDtFinal.Text)
      else
        QRConfereBaixaCr.SetVariable('DT_MOVIMENTO_FIM',null);
      QRConfereBaixaCr.open;
      if FRConfereBaixaContaReceber = nil then
       FRConfereBaixaContaReceber := TFRConfereBaixaContaReceber.Create(Application);
      FRConfereBaixaContaReceber.QRLTitulo.Caption := 'Relatório de Conferência das Baixas do Conta a Receber';
      if FConsultaAuditoriaParam.RGPreview.ItemIndex = 0 then
          FRConfereBaixaContaReceber.QRPrimario.Preview
        else
          FRConfereBaixaContaReceber.QRPrimario.Print;
      QRConfereBaixaCr.close;
    end;
  end;
end;

procedure TFAuditoriaCons.WMMouseWheel(var Msg: TWMMouseWheel);
var
  P: TPoint;
  I: Integer;
begin
  P := DBGrid1.ScreenToClient(Point(Msg.XPos, Msg.YPos));

  if PtInRect(DBGrid1.ClientRect, P) and
     Assigned(DBGrid1.DataSource) and
     Assigned(DBGrid1.DataSource.DataSet) and
     DBGrid1.DataSource.DataSet.Active then
  begin
    for I := 1 to 3 do
    begin
      if Msg.WheelDelta < 0 then
        DBGrid1.DataSource.DataSet.Next
      else
        DBGrid1.DataSource.DataSet.Prior;
    end;

    Msg.Result := 1;
  end
  else
    inherited;
end;

end.
