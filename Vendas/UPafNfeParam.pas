unit UPafNfeParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, UFmOperacao, UFmSerie, Mask, UFmNota,
  ComCtrls, ActnList;

type
  TFPafNfeParam = class(TForm)
    BtCancelarCupom: TBitBtn;
    BtTerminarFechamento: TBitBtn;
    GroupBox1: TGroupBox;
    cbCupom: TCheckBox;
    GroupBox2: TGroupBox;
    MESerie: TMaskEdit;
    MEModelo: TMaskEdit;
    BtTipoCadastro: TBitBtn;
    FmOperacao1: TFmOperacao;
    Label1: TLabel;
    FmNota1: TFmNota;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    procedure FmOperacao1BtOperacaoClick(Sender: TObject);
    procedure BtTipoCadastroClick(Sender: TObject);
    procedure MESerieExit(Sender: TObject);
    procedure FmOperacao1MeOperacaoExit(Sender: TObject);
    procedure BtTerminarFechamentoClick(Sender: TObject);
    procedure ChecaOperacao(Sender: TObject);
    procedure ChecaCupom;
    procedure cbCupomClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FmNota1MeNotaExit(Sender: TObject);
    procedure FmNota1BtNotaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
    wSerie: string;
    wOperacao: string;
    wCupom: integer;
  public
    { Public declarations }
    property Serie: string read wSerie write wSerie;
    property Operacao: string read wOperacao write wOperacao;
    property Cupom: integer read wCupom write wCupom;
  end;

var
  FPafNfeParam: TFPafNfeParam;

implementation

uses USerieCons, USerie_cl, UImpressoraFiscal_cl, UOracle_cl,
  UParamSistema_cl, UImpressoraFiscal;

{$R *.dfm}

procedure TFPafNfeParam.FmOperacao1BtOperacaoClick(Sender: TObject);
begin
  FmOperacao1.BtOperacaoClick(Sender);

end;

procedure TFPafNfeParam.BtTipoCadastroClick(Sender: TObject);
begin
  FSerieCons := TFSerieCons.Create(Application);
  with DMImpressoraFiscal do
  begin
    if QCupomFiscalCab.Recordcount > 0 then
    begin
      FSerieCons.METexto.Text :=
        QCupomFiscalCabCOD_FILIAL.Text;
      FSerieCons.METexto.Enabled := false;
    end;
  end;
  FSerieCons.BtProcurarClick(Self);
  if FSerieCons.ShowModal = MrOk then
  begin
    with DMSerie do
    begin
      if QSerieConsCOD_SERIE_MODELO.Value <> '55' then
      begin
        MessageDlg('Série informada não é de NF-e', mtError,
          [mbOk],0);
        Abort;
      end;
      MESerie.Text := QSerieConsCOD_SERIE.Value;
    end;
  end;
end;

procedure TFPafNfeParam.MESerieExit(Sender: TObject);
begin
  Serie := Trim(MESerie.Text);
end;

procedure TFPafNfeParam.ChecaCupom;
begin
  if not FmNota1.Visible then
    FmNota1.MeNota.Clear;
  if (cbCupom.Checked) and (Trim(FmNota1.MeNota.Text) = '') then
  begin
    MessageDlg('Cupom fiscal não informado', mtError, [mbOk],0);
    self.ModalResult := mrNone;
  end;
end;

procedure TFPafNfeParam.ChecaOperacao(Sender: TObject);
begin
  if Trim(MESerie.Text) = '' then
  begin
    MessageDlg('Série não informada', mtError, [mbOk],0);
    self.ModalResult := mrNone;
    Abort;
  end;
  MESerieExit(Self);
  if Trim(FmOperacao1.MeOperacao.Text) = '' then
  begin
    MessageDlg('Operação não informada', mtError, [mbOk],0);
    self.ModalResult := mrNone;
    Abort;
  end
  else
    Operacao := Trim(FmOperacao1.MeOperacao.Text);
  if DMOracle.FastSelect('IND_TIPO_OPERACAO','TB_OPERACAO','COD_OPERACAO = '+
      Operacao) <> 'S' then
  begin
    MessageDlg('Operação informada não é de saída', mtError, [mbOk],0);
    Abort;
    self.ModalResult := mrNone;
  end;
  if (Sender is TBitBtn) then
    Self.ModalResult := mrOk;
end;

procedure TFPafNfeParam.FmOperacao1MeOperacaoExit(Sender: TObject);
begin
  FmOperacao1.MeOperacaoExit(Sender);
  if Trim(FmOperacao1.MeOperacao.Text) <> '' then
  begin   
    ChecaOperacao(Sender);
  end;
end;

procedure TFPafNfeParam.BtTerminarFechamentoClick(Sender: TObject);
begin
  ChecaOperacao(Sender);
  ChecaCupom;
end;

procedure TFPafNfeParam.cbCupomClick(Sender: TObject);
begin
  FmNota1.Visible := cbCupom.Checked;
end;

procedure TFPafNfeParam.FormActivate(Sender: TObject);
begin
  MESerie.SetFocus;
  cbCupom.Checked := ((DMImpressoraFiscal.QCupomFiscalCab.Active) and
    (DMImpressoraFiscal.QCupomFiscalCab.RecordCount > 0));
  
end;

procedure TFPafNfeParam.FmNota1MeNotaExit(Sender: TObject);
begin
  FmNota1.MeNotaExit(Sender);
  if Trim(FmNota1.MeNota.Text) <> '' then
    if DMOracle.FastSelect('COD_SERIE_MODELO','TB_NOTA_CAB',
      'COD_NOTA_CAB = '+ Trim(FmNota1.MeNota.Text)) <> '2D' then
    begin
      MessageDlg('Este documento não é um cupom fiscal',mtError,[mbOk],0);
      FmNota1.MeNota.Clear;
      FmNota1.MeNota.SetFocus;
    end;
end;

procedure TFPafNfeParam.FmNota1BtNotaClick(Sender: TObject);
begin
  FmNota1.BtNotaClick(Sender);
  FmNota1.MeNota.SetFocus;
end;

procedure TFPafNfeParam.FormCreate(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFPafNfeParam.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
