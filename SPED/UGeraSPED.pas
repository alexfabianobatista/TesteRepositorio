unit UGeraSPED;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, UFmFilial,
  Mask, ImgList;

type
  TFGeraSPED = class(TFTParametro)
    TsFiscal: TTabSheet;
    TsContabil: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    MeDataIniFiscal: TMaskEdit;
    MeDataFinFiscal: TMaskEdit;
    FmFilialFiscal: TFmFilial;
    RgFinalidade: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    MeDataIniContabil: TMaskEdit;
    MeDataFinContabil: TMaskEdit;
    PnFilial: TPanel;
    Label5: TLabel;
    LbFiliais: TListBox;
    BtnLimpar: TBitBtn;
    FmFilialContabil: TFmFilial;
    BtnMatriz: TBitBtn;
    TsPisCofins: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    MeDataIniPisCofins: TMaskEdit;
    MeDataFinPisCofins: TMaskEdit;
    Panel1: TPanel;
    Label8: TLabel;
    lbFiliaisPisCofins: TListBox;
    btnLimparPisCofins: TBitBtn;
    FmFilialPisCofins: TFmFilial;
    btnMatrizPisCofins: TBitBtn;
    RGFinalidadePisCofins: TRadioGroup;
    MERecAnterior: TMaskEdit;
    Label9: TLabel;
    TsFCont: TTabSheet;
    Label10: TLabel;
    MeDataIniFCont: TMaskEdit;
    Label11: TLabel;
    MeDataFinFCont: TMaskEdit;
    Panel2: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    lblFiliaisFCont: TListBox;
    btnLimparFCont: TBitBtn;
    FmFilialFCont: TFmFilial;
    btnMatrizFCont: TBitBtn;
    RGFinalidadeFCont: TRadioGroup;
    MEFContRecAnterior: TMaskEdit;
    cbxBlocoP: TCheckBox;
    lbReciboLength: TLabel;
    TabSheet1: TTabSheet;
    Label14: TLabel;
    MeDataIniECF: TMaskEdit;
    Label15: TLabel;
    MeDataFinECF: TMaskEdit;
    FmFilialECF: TFmFilial;
    Label16: TLabel;
    lblFiliaisECF: TListBox;
    btnLimparECF: TBitBtn;
    btnMatrizECF: TBitBtn;
    lbArquivosRTF: TListBox;
    Label17: TLabel;
    btRtfAdd: TBitBtn;
    btRtfLimpar: TBitBtn;
    RadioGroup1: TRadioGroup;
    lblHashSubst: TLabel;
    MEHashLivroSubst: TMaskEdit;
    lblHash: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FmFilialContabilMeFilialExit(Sender: TObject);
    procedure FmFilialContabilBtFilialClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnMatrizClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FmFilialPisCofinsBtFilialClick(Sender: TObject);
    procedure FmFilialPisCofinsMeFilialExit(Sender: TObject);
    procedure btnLimparPisCofinsClick(Sender: TObject);
    procedure ik(Sender: TObject);
    procedure TsFiscalShow(Sender: TObject);
    procedure TsPisCofinsShow(Sender: TObject);
    procedure RGFinalidadePisCofinsClick(Sender: TObject);
    procedure MERecAnteriorExit(Sender: TObject);
    procedure FmFilialFContBtFilialClick(Sender: TObject);
    procedure FmFilialFContMeFilialExit(Sender: TObject);
    procedure btnLimparFContClick(Sender: TObject);
    procedure btnMatrizFContClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure RGFinalidadeFContClick(Sender: TObject);
    procedure MEFContRecAnteriorExit(Sender: TObject);
    procedure MEFContRecAnteriorChange(Sender: TObject);
    procedure FmFilialECFMeFilialExit(Sender: TObject);
    procedure btnLimparECFClick(Sender: TObject);
    procedure btnMatrizECFClick(Sender: TObject);
    procedure btRtfAddClick(Sender: TObject);
    procedure btRtfLimparClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure MEHashLivroSubstExit(Sender: TObject);
    procedure MEHashLivroSubstChange(Sender: TObject);
  private
    { Private declarations }
    wTipoPisCofins: Integer;
    wTipoFCont: Integer;
    wRecAntPisCofins: String;
    wRecAntFCont: String;
    TSAtivo: TTabSheet;
  public
    { Public declarations }
    wMatriz: integer;
    wGeraBlocoP: boolean;
    wHashContabilLivroSubstituido: String;
    function GeraStringsFiliais: TStrings;
    property TipoPisCofins: Integer read wTipoPisCofins write wTipoPisCofins;
    property TipoFCont: Integer read wTipoFCont write wTipoFCont;
    property RecAntPisCofins: String read wRecAntPisCofins Write wRecAntPisCofins;
    property RecAntFCont: String read wRecAntFCont write wRecAntFCont;
    property HashContabilLivroSubstituido: String read wHashContabilLivroSubstituido write wHashContabilLivroSubstituido;
  end;

var
  FGeraSPED: TFGeraSPED;

implementation

uses UOracle_cl, UContabil, UFiscal, UTela_cl, UParamSistema_cl,
  UBiblioteca;

{$R *.dfm}

procedure TFGeraSPED.FormShow(Sender: TObject);
begin
  inherited;
  if Trim(FmFilialFiscal.MeFilial.Text) <> '' then
    FmFilialFiscal.EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + FmFilialFiscal.MeFilial.Text, true)
  else
    FmFilialFiscal.EdFilial.Text := 'Todas';
end;

procedure TFGeraSPED.FmFilialContabilMeFilialExit(Sender: TObject);
begin
  inherited;
  FmFilialContabil.MeFilialExit(Sender);
  LbFiliais.Items.Add(Trim(FmFilialContabil.MeFilial.Text));

  FmFilialContabil.MeFilial.Clear;
  FmFilialContabil.EdFilial.Clear;
end;

function TFGeraSPED.GeraStringsFiliais: TStrings;
begin
  if (LbFiliais.Items.Count > 0) and (TSAtivo.Caption = 'Contábil') then
    Result := LbFiliais.Items
  else
    if (LbFiliaisPisCofins.Items.Count > 0) and (TSAtivo.Caption = 'PIS/Cofins') then
      Result := LbFiliaisPisCofins.Items
    else
      if (lblFiliaisFCont.Items.Count > 0) and (TSAtivo.Caption = 'FCont') then
        Result := lblFiliaisFCont.Items
      else
        if (lblFiliaisECF.Items.Count > 0) and (TSAtivo.Caption = 'ECF') then
          Result := lblFiliaisECF.Items
        else
          Result := TStrings.Create;
end;

procedure TFGeraSPED.FmFilialContabilBtFilialClick(Sender: TObject);
begin
  inherited;
  FmFilialContabil.BtFilialClick(Sender);
  LbFiliais.Items.Add(Trim(FmFilialContabil.MeFilial.Text));

  FmFilialContabil.MeFilial.Clear;
  FmFilialContabil.EdFilial.Clear;
end;

procedure TFGeraSPED.BtnLimparClick(Sender: TObject);
begin
  inherited;
  lbFiliais.Clear;
  wMatriz := 0;
  btnMatriz.Caption := 'Matriz';
end;

procedure TFGeraSPED.BtnMatrizClick(Sender: TObject);
begin
  inherited;
  wMatriz := StrToInt(lbFiliais.Items[lbFiliais.ItemIndex]);
  BtnMatriz.Caption := 'Matriz: ' + IntToStr(wMatriz);
end;

procedure TFGeraSPED.FormCreate(Sender: TObject);
begin
  inherited;
  wMatriz := 0;


end;

procedure TFGeraSPED.FormActivate(Sender: TObject);
begin
  inherited;
  PnFilial.Visible := True;
//  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO') or
//    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = '.') or
//    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED')) then
//    PnFilial.Visible := True
//  else
//    PnFilial.Visible := False;
end;

procedure TFGeraSPED.FmFilialPisCofinsBtFilialClick(Sender: TObject);
begin
  inherited;
  FmFilialPisCofins.BtFilialClick(Sender);
  LbFiliaisPisCofins.Items.Add(Trim(FmFilialPisCofins.MeFilial.Text));

  FmFilialPisCofins.MeFilial.Clear;
  FmFilialPisCofins.EdFilial.Clear;
end;

procedure TFGeraSPED.FmFilialPisCofinsMeFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(FmFilialPisCofins.MeFilial.Text) <> '' then
  begin
    FmFilialPisCofins.MeFilialExit(Sender);
    LbFiliaisPisCofins.Items.Add(Trim(FmFilialPisCofins.MeFilial.Text));
    FmFilialPisCofins.MeFilial.Clear;
    FmFilialPisCofins.EdFilial.Clear;
  end;
end;

procedure TFGeraSPED.btnLimparPisCofinsClick(Sender: TObject);
begin
  inherited;
  lbFiliaisPisCofins.Clear;
  wMatriz := 0;
  btnMatrizPisCofins.Caption := 'Matriz';
end;

procedure TFGeraSPED.ik(Sender: TObject);
begin
  inherited;
  if lbFiliaisPisCofins.ItemIndex < 0 then
  begin
    MessageDlg('Por favor selecione uma filial para ser a matriz', mtError,
      [mbOk],0);
    Abort;
  end;
  wMatriz := StrToInt(lbFiliaisPisCofins.Items[lbFiliaisPisCofins.ItemIndex]);
  BtnMatrizPisCofins.Caption := 'Matriz: ' + IntToStr(wMatriz);
end;

procedure TFGeraSPED.TsFiscalShow(Sender: TObject);
begin
  inherited;
  Bib.PriUltData(MeDataIniFiscal, MeDataFinFiscal, True);
end;

procedure TFGeraSPED.TsPisCofinsShow(Sender: TObject);
begin
  inherited;
  Bib.PriUltData(MeDataIniPisCofins, MeDataFinPisCofins, True);
end;

procedure TFGeraSPED.RGFinalidadePisCofinsClick(Sender: TObject);
begin
  inherited;
  MERecAnterior.Enabled := (RGFinalidadePisCofins.ItemIndex = 1);
  TipoPisCofins := RGFinalidadePisCofins.ItemIndex;
end;

procedure TFGeraSPED.MERecAnteriorExit(Sender: TObject);
begin
  inherited;
  if length(Trim(TMaskEdit(Sender).Text)) <> 41 then
  begin
    MessageDlg('O número do recibo anterior deve ter 41 dígitos', mtError,
      [mbOk],0);
    Abort;
  end;
  RecAntPisCofins := Trim(MERecAnterior.Text);
end;

procedure TFGeraSPED.FmFilialFContBtFilialClick(Sender: TObject);
begin
  inherited;
  FmFilialFCont.BtFilialClick(Sender);
  LblFiliaisFCont.Items.Add(Trim(FmFilialFCont.MeFilial.Text));

  FmFilialFCont.MeFilial.Clear;
  FmFilialFCont.EdFilial.Clear;
end;

procedure TFGeraSPED.FmFilialFContMeFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(FmFilialFCont.MeFilial.Text) <> '' then
  begin
    FmFilialFCont.MeFilialExit(Sender);
    LblFiliaisFCont.Items.Add(Trim(FmFilialFCont.MeFilial.Text));
    FmFilialFCont.MeFilial.Clear;
    FmFilialFCont.EdFilial.Clear;
  end;
end;

procedure TFGeraSPED.btnLimparFContClick(Sender: TObject);
begin
  inherited;
  lblFiliaisFCont.Clear;
  wMatriz := 0;
  btnMatrizFCont.Caption := 'Matriz';
end;

procedure TFGeraSPED.btnMatrizFContClick(Sender: TObject);
begin
  inherited;
  if lblFiliaisFCont.ItemIndex < 0 then
  begin
    MessageDlg('Por favor selecione uma filial para ser a matriz', mtError,
      [mbOk],0);
    Abort;
  end;
  wMatriz := StrToInt(lblFiliaisFCont.Items[lblFiliaisFCont.ItemIndex]);
  BtnMatrizFCont.Caption := 'Matriz: ' + IntToStr(wMatriz);
end;

procedure TFGeraSPED.BtOkClick(Sender: TObject);
begin
  inherited;
  TSAtivo := PGRelatorio.ActivePage;
end;

procedure TFGeraSPED.RGFinalidadeFContClick(Sender: TObject);
begin
  inherited;
  MEFContRecAnterior.Enabled := (RGFinalidadeFCont.ItemIndex = 1);
  if MEFContRecAnterior.Enabled then
    MEFContRecAnterior.Color := clWindow
  else
  begin
    MEFContRecAnterior.Color := clBtnFace;
    MEFContRecAnterior.Clear;
    RecAntFCont := '';
  end;
  TipoFCont := RGFinalidadeFcont.ItemIndex;
end;

procedure TFGeraSPED.MEFContRecAnteriorExit(Sender: TObject);
begin
  inherited;
  if length(Trim(TMaskEdit(Sender).Text)) <> 41 then
  begin
    MessageDlg('O número do recibo anterior deve ter 41 dígitos', mtError,
      [mbOk],0);
    Abort;
    TMaskEdit(Sender).SetFocus;
  end;
  RecAntFCont := Trim(TMaskEdit(Sender).Text);
end;

procedure TFGeraSPED.MEFContRecAnteriorChange(Sender: TObject);
begin
  inherited;
  lbReciboLength.Visible := (Length(MEFContRecAnterior.Text) > 0);
  if lbReciboLength.Visible then
    lbReciboLength.Caption := IntToStr(Length(MEFContRecAnterior.Text))+
    ' caracteres.';
end;

procedure TFGeraSPED.FmFilialECFMeFilialExit(Sender: TObject);
begin
  inherited;
  LblFiliaisECF.Items.Add(Trim(FmFilialECF.MeFilial.Text));
  FmFilialECF.MeFilial.Clear;
  FmFilialECF.EdFilial.Clear;
end;

procedure TFGeraSPED.btnLimparECFClick(Sender: TObject);
begin
  inherited;
  LblFiliaisECF.Clear;
  wMatriz := 0;
  btnMatrizECF.Caption := 'Matriz';
end;

procedure TFGeraSPED.btnMatrizECFClick(Sender: TObject);
begin
  inherited;
  wMatriz := StrToInt(LblFiliaisECF.Items[LblFiliaisECF.ItemIndex]);
  BtnMatrizECF.Caption := 'Matriz: ' + IntToStr(wMatriz);
end;

procedure TFGeraSPED.btRtfAddClick(Sender: TObject);
  var dialog: TOpenDialog;
begin
  inherited;
  dialog := TOpenDialog.Create(Self);
  dialog.InitialDir := 'C:\';
  dialog.Filter := 'Arquivos RTF|*.rtf';
  if dialog.Execute then
    lbArquivosRTF.Items.Add(dialog.FileName);

end;

procedure TFGeraSPED.btRtfLimparClick(Sender: TObject);
begin
  inherited;
  if lbArquivosRTF.Items.Count = 0 then
    exit;
  if MessageDlg('Deseja limpar todos os documentos informados?'
    , mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    lbArquivosRTF.Clear;
end;

procedure TFGeraSPED.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  if RadioGroup1.ItemIndex = 1 then
  begin
    lblHashSubst.Visible := true;
    MEHashLivroSubst.Visible := true;
  end
  else
  begin
    lblHash.Visible := false;
    lblHashSubst.Visible := false;
    MEHashLivroSubst.Visible := false;
  end;
    
end;

procedure TFGeraSPED.MEHashLivroSubstExit(Sender: TObject);
begin
  inherited;
  wHashContabilLivroSubstituido := Trim(MEHashLivroSubst.Text);
end;

procedure TFGeraSPED.MEHashLivroSubstChange(Sender: TObject);
begin
  inherited;
  lblHash.Visible := (Length(MEFContRecAnterior.Text) > 0);
  if lblHash.Visible then
    lblHash.Caption := IntToStr(Length(MEHashLivroSubst.Text)) + ' caracteres.' ;
end;

end.



