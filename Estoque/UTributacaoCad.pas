unit UTributacaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBPanel, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFTributacaoCad = class(TFTCadSimples)
    Tributao1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel8: TDBPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    dbcIndice: TDBComboBox;
    Label6: TLabel;
    DBComboBox1: TDBComboBox;
    lbTribImpFiscal: TLabel;
    DBPanel9: TDBPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DBComboBox2: TDBComboBox;
    Label2: TLabel;
    Label4: TLabel;
    DBPanel5: TDBPanel;
    DBPanel10: TDBPanel;
    DBComboBox3: TDBComboBox;
    Label5: TLabel;
    DBPanel6: TDBPanel;
    Panel2: TPanel;
    DBPanel11: TDBPanel;
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    DBLCCCST_IBS_CBS: TDBLookupComboBox;
    DBPanel12: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Tributao1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBComboBox1Change(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
  private
    procedure MsgTributacao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTributacaoCad: TFTributacaoCad;

implementation

uses UTributacao_cl, UTributacaoCons, UTributacaoParam, URTributacao;

{$R *.DFM}

procedure TFTributacaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMTributacao do
    QTributacao.open;
end;

procedure TFTributacaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  If FtributacaoCons.ShowModal = mrOk then
  With DMTributacao do
  Begin
    QTributacao.Close;
    QTributacao.SetVariable('PK',QTributacaoConsCod_Tributacao.Value);
    QTributacao.Open;
  End;
  MsgTributacao;
end;

procedure TFTributacaoCad.Tributao1Click(Sender: TObject);
begin
  inherited;
  If FTributacaoParam=Nil then
    FTributacaoParam:=TFTributacaoParam.Create(Application);
  FTributacaoParam.PGRelatorio.Pages[0].TabVisible:=true;
  If FTributacaoParam.Showmodal= mrOk then
    Begin
      DMTributacao.QRTributacao.Close;
      If FRTributacao=Nil then
        FRTributacao:=TFRTributacao.Create(Application);
      DMTributacao.QRTributacao.Open;
      If FTributacaoParam.RGPreview.ItemIndex=0 then
        FRTributacao.QRPrimario.Preview
      Else
        FRTributacao.QRPrimario.Print;
      DMTributacao.QRTributacao.Close;
    End;
end;

procedure TFTributacaoCad.SBConfirmarClick(Sender: TObject);
Var
  wCodigo:real;
begin
  with DMTributacao do
  begin
  // Retirada a validação pois a tributação agora possui 2 cst e csosn
//    if (StrToInt('0'+Copy(QTributacaoDESC_SITUACAO_TRIB.Value,2,2)) in [30, 40, 41, 50, 60]) or
//       (StrToInt('0'+QTributacaoDESC_CSOSN.Value) in [101, 102, 103, 201, 202, 203]) or
//       (StrToInt('0'+QTributacaoDESC_CSOSN.Value) = 400) or
//       (StrToInt('0'+QTributacaoDESC_CSOSN.Value) = 500) then
//    begin
//      QTributacaoPERC_TRIBUTADO.Value := 0;
//      QTributacaoPERC_ALIQUOTA.Value := 0;
//      QTributacaoPERC_TRIBUTADO_NOTA.Value := 0;
//      QTributacaoNUM_CLASSIFICACAO.Value := '4';
//      MessageDlg('O CST ou o CSOSN informado não permite informar base de cálculo e alíquota maiores que zero. '+
//                'Por isso esses campos foram zerados e a classificação mudada para isento.', mtInformation, [mbOk],0);
//    end;
    if (QTributacaoPERC_TRIBUTADO.Value > 0) and
       (Copy(QTributacaoDESC_SITUACAO_TRIB.Value,2,2) <> '90') and
       (QTributacaoDESC_CSOSN.Value <> '900')  then
    begin
      if QTributacaoPERC_TRIBUTADO.Value = 100 then
        QTributacaoNUM_CLASSIFICACAO.Value := '0'
      else if QTributacaoPERC_TRIBUTADO.Value > 100 then
        QTributacaoNUM_CLASSIFICACAO.Value := '3'
      else
        QTributacaoNUM_CLASSIFICACAO.Value := '2';
    end;
    if (Copy(QTributacaoDESC_SITUACAO_TRIB.Value,2,2) = '51') then
      if (QTributacaoPERC_DIFERIMENTO.Value = 100) then
        QTributacaoNUM_CLASSIFICACAO.Value := '5'
      else
        QTributacaoNUM_CLASSIFICACAO.Value := '0';
  end;
  inherited;
  wCodigo:=DMTributacao.QTributacaoCod_Tributacao.Value;
  DMTributacao.QTributacao.Close;
  DMTributacao.QTributacao.SetVariable('PK',wCodigo);
  DMTributacao.QTributacao.Open;
end;

procedure TFTributacaoCad.SBCancelarClick(Sender: TObject);
Var
  wCodigo:real;
begin
  wCodigo:=DMTributacao.QTributacaoCod_Tributacao.Value;
  inherited;
  DMTributacao.QTributacao.Close;
  DMTributacao.QTributacao.SetVariable('PK',wCodigo);
  DMTributacao.QTributacao.Open;
end;

procedure TFTributacaoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(3);
end;

procedure TFTributacaoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMTributacao do
    QTributacao.Close;
  Action := CaFree;
  FTributacaoCad := Nil;
end;

procedure TFTributacaoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  DBComboBox1.Enabled := DSPrimario.DataSet.State in [dsInsert, dsEdit];
  DBComboBox2.Enabled := DSPrimario.DataSet.State in [dsInsert, dsEdit];
  dbcIndice.Enabled := DSPrimario.DataSet.State in [dsInsert, dsEdit];
  DBComboBox3.Enabled := DSPrimario.DataSet.State in [dsInsert, dsEdit];
  DBLCCCST_IBS_CBS.Enabled := DSPrimario.DataSet.State in [dsInsert, dsEdit];

  with DMTributacao do
    QCSTReformaTributaria.open;
end;

procedure TFTributacaoCad.DBComboBox1Change(Sender: TObject);
var wHabilitado: Boolean;
begin
  inherited;
  wHabilitado := DBComboBox1.ItemIndex in [3,4,5];
  if not wHabilitado then
  begin
    dbcIndice.ItemIndex := 0;
    DMTributacao.QTributacaoNUM_INDICE_TRIB_ECF.Clear;
  end;
  dbcIndice.Enabled := wHabilitado;
  MsgTributacao
end;

procedure TFTributacaoCad.MsgTributacao;
begin
  if DBComboBox1.Text = 'I' then
    lbTribImpFiscal.Caption := '* Isento'
  else
    if DBComboBox1.Text = 'N' then
      lbTribImpFiscal.Caption := '* Não Tributado'
    else
      if DBComboBox1.Text = 'F' then
        lbTribImpFiscal.Caption := '* Substituição Tributária'
      else
        if DBComboBox1.Text = 'T' then
          lbTribImpFiscal.Caption := '* Tributado pelo ICMS'
        else
          if DBComboBox1.Text = 'S' then
            lbTribImpFiscal.Caption := '* Tributado pelo ISSQN'
          else
              lbTribImpFiscal.Caption := '* Somente para Impressora Fiscal';
end;

procedure TFTributacaoCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  MsgTributacao;
end;

end.
