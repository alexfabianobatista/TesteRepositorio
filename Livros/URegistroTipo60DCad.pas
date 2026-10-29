unit URegistroTipo60DCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, UFmFilial, DBPanel;

type
  TFRegistroTipo60DCad = class(TFTCadSimples)
    pgOpcoes: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    FmFilial1: TFmFilial;
    MeMes: TMaskEdit;
    MeAno: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    btImportar: TBitBtn;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    procedure btImportarClick(Sender: TObject);
    procedure pgOpcoesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegistroTipo60DCad: TFRegistroTipo60DCad;

implementation

uses UImpressoraFiscal, UUsuario_cl, UOracle_cl, UImpressoraFiscal_cl,
  UAguarde, URegistroTipo60DCons;

{$R *.dfm}

procedure TFRegistroTipo60DCad.btImportarClick(Sender: TObject);
var i,j: integer;
begin
  inherited;
  if (Trim(FmFilial1.MeFilial.Text) = '') or
    (Trim(MeMes.Text) = '') or (Trim(MeAno.Text) = '') then
  begin
    MessageDlg('Todos os campos devem ser preenchidos', mtError, [mbOk],0);
    Abort;
  end;

  if FAguarde = Nil then
    FAguarde := TFAguarde.Create(Application);
  FAguarde.Show();
  Application.ProcessMessages;
  try

      FImpressoraFiscal.RegistroTipo60D(StrToInt(Trim(FmFilial1.MeFilial.Text)),
        Trim(MeMes.Text), Trim(MeAno.Text));
    
  finally
    FAguarde.Close;
  end;
  for i:=0 to ComponentCount-1 do
    if (Components[i].GetParentComponent = Panel1) then
      TSpeedButton(Components[i]).Enabled := false;
    for j:=0 to MMCadSimples.Items.Count-1 do
      MMCadSimples.Items[j].Enabled := false;
  
end;

procedure TFRegistroTipo60DCad.pgOpcoesChanging(Sender: TObject;
  var AllowChange: Boolean);
var i,j: integer;
begin
  inherited;
  if pgOpcoes.ActivePageIndex = 1 then
  begin
    DMImpressoraFiscal.QReg60D.CommitOnPost := false;
    for i:=0 to ComponentCount-1 do
      if (Components[i].GetParentComponent = Panel1) then
        TSpeedButton(Components[i]).Enabled := false;
    for j:=0 to MMCadSimples.Items.Count-1 do
      MMCadSimples.Items[j].Enabled := false;
  end
  else
  begin
    DMImpressoraFiscal.QReg60D.CommitOnPost := true;
    for i:=0 to ComponentCount-1 do
      if (Components[i].GetParentComponent = Panel1) then
        if (TSpeedButton(Components[i]).Name <> 'SBConfirmar') and (TSpeedButton(Components[i]).Name <> 'SBCancelar') then
          TSpeedButton(Components[i]).Enabled := true;
    for j:=0 to MMCadSimples.Items.Count-1 do   
        MMCadSimples.Items[j].Enabled := true;
  end;
end;

procedure TFRegistroTipo60DCad.FormCreate(Sender: TObject);
var i,j: integer;
wDia,wMes,wAno: word;
begin
  inherited;
  DMImpressoraFiscal.QReg60D.Open;
  for i:=0 to ComponentCount-1 do
    if (Components[i].GetParentComponent = Panel1) then
      TSpeedButton(Components[i]).Enabled := false;
    for j:=0 to MMCadSimples.Items.Count-1 do
      MMCadSimples.Items[j].Enabled := false;
    if DMUsuario.CodFilialUsuario > 0 then
    FmFilial1.MeFilial.Text :=
      IntToStr(DMUsuario.CodFilialUsuario)
    else
      FmFilial1.MeFilial.Text := '1';
    decodeDate(DMOracle.DataServ,wAno,wMes,wDia);
    if wMes > 1 then
      MeMes.Text := formatFloat('00',wMes-1)
    else
      MeMes.Text := IntToStr(wMes);
    MeAno.Text := IntToStr(wAno);
end;

procedure TFRegistroTipo60DCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FRegistroTipo60DCons = Nil then
    FRegistroTipo60DCons := TFRegistroTipo60DCons.Create(Application);
  if FRegistroTipo60DCons.ShowModal = MrOk then
  begin
    MELocaliza.Text := DMImpressoraFiscal.qreg60dconsCOD_REGISTRO_DIARIO.Text;
    MELocalizaExit(Self);
  end;
end;

end.
