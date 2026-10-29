unit UClasseCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBDirceu, variants, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFClasseCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Classe1: TMenuItem;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    BtRamo: TSpeedButton;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    BtMensagem: TSpeedButton;
    DBEdit10: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBRGAreaReceituario: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    GbMargem: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Classe1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtRamoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtMensagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClasseCad: TFClasseCad;

implementation

uses UClasse_cl, UClasseCons, UClasseParam, URClasse, URamoCons, URamo_cl,
  UParamSistema_cl, UTipoLoteCons, UTipoLote_cl, UMensagemCons,
  UMensagem_cl;

{$R *.DFM}

procedure TFClasseCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMClasse.QClasse.Open;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'RADIO' Then
   Begin
     Label4.Caption := '%Comissão';
     Label3.Caption := '%Redução';
   End;
end;

procedure TFClasseCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  With DMClasse do
  Begin
    QClasse.Close;
    QClasse.SetVariable('PK',QClasseConsCod_Classe.Value);
    QClasse.Open;
  End;
end;

procedure TFClasseCad.Classe1Click(Sender: TObject);
Var
  classe_inicial,classe_final:string;
begin
  inherited;
  If FClasseParam = Nil then
    FClasseParam := TFClasseParam.Create(Application);
  FClasseParam.PGRelatorio.Pages[0].TabVisible:=True;
  If FClasseParam.ShowModal = mrOk then
   Begin
    With DMClasse do
      Begin
        QRClasse.Close;
        If FClasseParam.ME0NrClasseInicial.Text<>'' then
          Begin
            classe_inicial:= FormatFloat('000',StrToFloat(FClasseParam.ME0NrClasseInicial.Text))
                             +FormatFloat('000',StrToFloat(FClasseParam.ME0NrSubClasseInicial.Text));
            QRClasse.SetVariable('CLASSE_INICIAL',classe_inicial);
          End
        Else
          QRClasse.SetVariable('CLASSE_INICIAL',Null);
        If FClasseParam.ME0NrClasseFinal.Text<>'' then
          Begin
            classe_final:= FormatFloat('000',StrToFloat(FClasseParam.ME0NrClasseFinal.Text))
                          +FormatFloat('000',StrToFloat(FClasseParam.ME0NrSubClasseFinal.Text));
            QRClasse.SetVariable('CLASSE_FINAL',classe_final);
          End
        Else
          QRClasse.SetVariable('CLASSE_FINAL',Null);
        Case FClasseParam.RgSituacao.ItemIndex of
          0 : QRClasse.SetVariable('Ind_Situacao', 'ATIVO');
          1 : QRClasse.SetVariable('Ind_Situacao', 'INATIVO');
          2 : QRClasse.SetVariable('Ind_Situacao', Null);
        End;
        QRClasse.Open;
        If FRClasse=Nil then
          FRClasse := TFRClasse.Create(Application);
        If FClasseParam.Rg0Campos.ItemIndex = 0 Then
         Begin
           FRClasse.QrDbtext5.Enabled := True;
           FRClasse.QrDbtext6.Enabled := True;
           FRClasse.QrLabel9.Enabled := True;
           FRClasse.QrLabel10.Enabled := True;
         End
        Else
         Begin
           FRClasse.QrDbtext5.Enabled := False;
           FRClasse.QrDbtext6.Enabled := False;
           FRClasse.QrLabel9.Enabled := False;
           FRClasse.QrLabel10.Enabled := False;
         End;
        If FClasseParam.RGPreview.ItemIndex=0 then
          FRClasse.QRPrimario.Preview
        Else
          FRClasse.QRPrimario.Print;
        QRClasse.Close;
      End;
    End;
end;

procedure TFClasseCad.SBConfirmarClick(Sender: TObject);
Var
  wCodigo:real;
begin
  wCodigo:=DMClasse.QClasseCod_Classe.Value;
  inherited;
  DMClasse.QClasse.Close;
  DMClasse.QClasse.SetVariable('PK',wCodigo);
  DMClasse.QClasse.Open;
end;

procedure TFClasseCad.SBCancelarClick(Sender: TObject);
Var
  wCodigo:real;
begin
  wCodigo:=DMClasse.QClasseCod_Classe.Value;
  inherited;
  DMClasse.QClasse.Close;
  DMClasse.QClasse.SetVariable('PK',wCodigo);
  DMClasse.QClasse.Open;
end;

procedure TFClasseCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(2);
end;

procedure TFClasseCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMClasse.QClasse.Close;
  Action := CaFree;
  FClasseCad := Nil;
end;

procedure TFClasseCad.BtRamoClick(Sender: TObject);
begin
  inherited;
  If FRamoCons = Nil then
    FRamoCons := TFRamoCons.Create(Application);
  If FRamoCons.ShowModal = mrOk then
    DMClasse.QClasseCod_Ramo.Value:= DMRamo.QRamoConsCod_Ramo.Value;

end;

procedure TFClasseCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DsEdit,DsInsert] then
    begin
      BtRamo.Enabled:=True;
      BtMensagem.Enabled:=True;
    end
  else
    begin
      BtRamo.Enabled:=False;
      BtMensagem.Enabled:=False;
    end;
end;

procedure TFClasseCad.FormCreate(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI') Then
    DBRGAreaReceituario.Visible := true
  else
    DBRGAreaReceituario.Visible := false;
end;

procedure TFClasseCad.BtMensagemClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
    DMClasse.QClasseCod_Mensagem.Value:= DMMensagem.QMensagemConsCod_Mensagem.Value;
end;

end.

