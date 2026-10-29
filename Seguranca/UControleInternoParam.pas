unit UControleInternoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls;

type
  TFcontroleInternoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    ME0_Filial: TMaskEdit;
    Label31: TLabel;
    BT0_Filial: TSpeedButton;
    GroupBox9: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    ME0_DtInicial: TMaskEdit;
    ME0_DtFinal: TMaskEdit;
    Label1: TLabel;
    ME0_Usuario: TMaskEdit;
    BT0_Usuario: TSpeedButton;
    ED0_Usuario: TMaskEdit;
    ED0_Filial: TMaskEdit;
    Label2: TLabel;
    DBLookupCB0_Mod: TDBLookupComboBox;
    Label4: TLabel;
    CKB_Todos: TCheckBox;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    ME1CodFilial: TMaskEdit;
    SB1FilialCons: TSpeedButton;
    Ed1FilialDesc: TMaskEdit;
    Label5: TLabel;
    ME1CodUsuario: TMaskEdit;
    SB1UsuarioCons: TSpeedButton;
    Ed1UsuarioNome: TMaskEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ME1DataI: TMaskEdit;
    ME1DataF: TMaskEdit;
    TabSheet3: TTabSheet;
    ME2Usuario: TMaskEdit;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    ME2DtInicial: TMaskEdit;
    ME2DtFinal: TMaskEdit;
    ED2Usuario: TEdit;
    procedure ME0_FilialExit(Sender: TObject);
    procedure BT0_FilialClick(Sender: TObject);
    procedure ME0_UsuarioExit(Sender: TObject);
    procedure BT0_UsuarioClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ME1CodFilialExit(Sender: TObject);
    procedure ME1CodUsuarioExit(Sender: TObject);
    procedure SB1FilialConsClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure ME2UsuarioExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FcontroleInternoParam: TFcontroleInternoParam;

implementation

uses UUsuario_cl, UFilial_cl, UControleInterno_cl, UFuncao_cl, UUsuarioCons,
  UFilialCons, UOracle_cl, UModuloCons;

{$R *.DFM}

procedure TFcontroleInternoParam.ME0_FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0_Filial.Text) <> '' Then
  begin

   with DMFilial do
   begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME0_Filial.Text);
    QFilial.Open;
    ED0_Filial.Text := QFilialDesc_Filial.Text;
   end;

  end
  else
     ED0_Filial.Text := 'Todos';
end;

procedure TFcontroleInternoParam.BT0_FilialClick(Sender: TObject);
begin
  inherited;
  with DMFilial do
  begin
    If FFilialCons = Nil then
      FFilialCons := TFFilialCons.Create(Application);
    If FFilialCons.ShowModal = mrOk then
    Begin
      ME0_Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
      ME0_FilialExit(Self);
    End;
  end;
end;

procedure TFcontroleInternoParam.ME0_UsuarioExit(Sender: TObject);
begin
inherited;
  If Trim(ME0_Usuario.Text) <> '' Then
  With DMUsuario do
  Begin
    QUsuario.Close;
    QUsuario.SetVariable('PK',ME0_Usuario.Text);
    QUsuario.Open;
    ED0_Usuario.Text := QUsuarioNOME.Text;
  End
  Else
    ED0_Usuario.Text := 'Todos';

end;

procedure TFcontroleInternoParam.BT0_UsuarioClick(Sender: TObject);
begin
  inherited;
  with DMUsuario do
  begin
    if FUsuarioCons = nil then
       FUsuarioCons := TFUsuarioCons.Create(Application);
    if FUsuarioCons.ShowModal = mrOk then
    begin
      ME0_Usuario.Text := DMUsuario.QUsuarioCOD_USUARIO.Text;
      ME0_UsuarioExit(Self);
    end;
  end;
end;

procedure TFcontroleInternoParam.FormActivate(Sender: TObject);
begin
  inherited;
  ME0_Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
end;

procedure TFcontroleInternoParam.FormCreate(Sender: TObject);
begin
  inherited;
  DBLookupCB0_Mod.ListFieldIndex := 0;
end;

procedure TFcontroleInternoParam.ME1CodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodFilial.Text) <> '' Then
  begin
   with DMFilial do
   begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME1CodFilial.Text);
    QFilial.Open;
    ED1FilialDesc.Text := QFilialDesc_Filial.Text;
   end;
  end
  else
     ED1FilialDesc.Text := 'Todos';

end;

procedure TFcontroleInternoParam.ME1CodUsuarioExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodUsuario.Text) <> '' Then
  with DMUsuario do
  begin
    QUsuario.Close;
    QUsuario.SetVariable('PK',ME1CodUsuario.Text);
    QUsuario.Open;
    ED1UsuarioNome.Text := QUsuarioNOME.Text;
  end
  else
     ED1UsuarioNome.Text := 'Todos';
end;

procedure TFcontroleInternoParam.SB1FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME1CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME1CodFilialExit(Self);
  end;
end;

procedure TFcontroleInternoParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  ME0_DtInicial.Text := DateToStr(DATE-1);
  ME0_DtFinal.Text := DateToStr(DATE);
end;

procedure TFcontroleInternoParam.ME2UsuarioExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Usuario.Text) <> '' Then
    ED2Usuario.Text := DMOracle.BuscaNome('SELECT TB_USUARIO.NOME FROM TB_USUARIO','COD_USUARIO = '+Trim(ME2Usuario.Text))
  Else
    ED2Usuario.Text := 'Todos';
end;

procedure TFcontroleInternoParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FUsuarioCons = nil then
     FUsuarioCons := TFUsuarioCons.Create(Application);
  if FUsuarioCons.ShowModal = mrOk then
  begin
    ME2Usuario.Text := DMUsuario.QUsuarioConsCOD_USUARIO.Text;
    ME2UsuarioExit(Self);
  end;
end;

end.
