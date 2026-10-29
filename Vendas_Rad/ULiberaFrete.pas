unit ULiberaFrete;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Db, Grids, DBGrids, ExtCtrls, variants;

type
  TFLiberaFrete = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MeDtInicial: TMaskEdit;
    MeDtFinal: TMaskEdit;
    Label57: TLabel;
    MEFilial: TMaskEdit;
    BtConsFilial: TBitBtn;
    EdFilial: TEdit;
    DBGrid1: TDBGrid;
    DsLiberaSeguro: TDataSource;
    SBProcura: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    RGTipoNota: TRadioGroup;
    procedure MEFilialExit(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure SBProcuraClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiberaFrete: TFLiberaFrete;

implementation

uses UNotaSaida_cl, UFilial_cl, UFilialCons, UOracle_cl, UParamSistema_cl,
  URSeguroCargas, URelatorioVenda_cl, UUsuario_cl, URSeguroCargas1;

{$R *.DFM}

procedure TFLiberaFrete.MEFilialExit(Sender: TObject);
begin
  If Trim(MEFilial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',MEFilial.Text);
    QFilial.Open;
    EdFilial.Text := QFilialDesc_Filial.Value;
  End
  Else
    EdFilial.Text := 'Todos';

end;

procedure TFLiberaFrete.BtConsFilialClick(Sender: TObject);
begin
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilialExit(Self);
  End;

end;

procedure TFLiberaFrete.SBProcuraClick(Sender: TObject);
begin
  With DMNotaSaida do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(MeFilial.Text),'VENDA');
    QLiberaSeguro.Close;

    If Trim(FLiberaFrete.MeDtInicial.Text)= ''   then
      QLiberaSeguro.SetVariable('DATA_I',Null)
    Else
      QLiberaSeguro.SetVariable('DATA_I',StrToDate(FLiberaFrete.MeDtInicial.Text));
    If Trim(FLiberaFrete.MeDtFinal.Text)= ''   then
      QLiberaSeguro.SetVariable('DATA_F',Null)
    Else
      QLiberaSeguro.SetVariable('DATA_F',StrToDate(FLiberaFrete.MeDtFinal.Text));
    If Trim(FLiberaFrete.MeFilial.Text)= ''   then
      QLiberaSeguro.SetVariable('FILIAL',Null)
    Else
      QLiberaSeguro.SetVariable('FILIAL',StrToFloat(FLiberaFrete.MeFilial.Text));
    Case RGTipoNota.ItemIndex of
      0: QLiberaSeguro.SetVariable('IND_ENT_SAIDA','E');
      1: QLiberaSeguro.SetVariable('IND_ENT_SAIDA','S');
      2: QLiberaSeguro.SetVariable('IND_ENT_SAIDA', Null);
    End;
    QLiberaSeguro.Open;
  End;
end;

procedure TFLiberaFrete.SpeedButton1Click(Sender: TObject);
Var wSimNao,wComando:String;
begin
  wSimNao := 'NAO';
  If DMNotaSaida.QLiberaSeguroInd_Nota_Seguro.Value = 'NAO'
  Then
     wSimNao := 'SIM';
  With DMOracle do
  Begin
    QExecSQL.Close;
    QExecSQL.SQL.Clear;
    wComando := 'UPDATE TB_NOTA_CAB SET IND_NOTA_SEGURO = '+ chr(39) + wSimNao +chr(39);
    wComando := wComando + ' WHERE COD_NOTA_CAB = '+FloatToStr(DMNotaSaida.QLiberaSeguroCod_Nota_Cab.Value);
    QExecSQL.SQL.Add(wComando);
    QExecSQL.ExecSQL;
  End;
//  DMNotaSaida.QLiberaSeguro.Close;
//  DMNotaSaida.QLiberaSeguro.Open;

end;

procedure TFLiberaFrete.FormActivate(Sender: TObject);
begin
  MEFilial.Text:=FloatToStr(DMParamSistema.QParamSistemaCOD_FILIAL.Value);
  MEFilialExit(Self);
end;

procedure TFLiberaFrete.SpeedButton2Click(Sender: TObject);
var
  wstrEntSaida : String;
begin
  With DMRelatorio_Venda do
  Begin
    QrSeguroCarga.Close;
    QrSeguroCarga1.Close;
    If Trim(FLiberaFrete.MeDtInicial.Text)= ''   then
    Begin
       QrSeguroCarga.SetVariable('DATA_I',Null);
       QrSeguroCarga1.SetVariable('DATA_I',Null);
    End
    Else
    Begin
      QrSeguroCarga.SetVariable('DATA_I',FLiberaFrete.MeDtInicial.Text);
      QrSeguroCarga1.SetVariable('DATA_I',FLiberaFrete.MeDtInicial.Text);
    End;

    If Trim(FLiberaFrete.MeDtFinal.Text)= ''   then
    Begin
      QrSeguroCarga.SetVariable('DATA_F',Null);
      QrSeguroCarga1.SetVariable('DATA_F',Null);
    End
    Else
    Begin
      QrSeguroCarga.SetVariable('DATA_F',FLiberaFrete.MeDtFinal.Text);
      QrSeguroCarga1.SetVariable('DATA_F',FLiberaFrete.MeDtFinal.Text);
    End;

    If Trim(FLiberaFrete.MeFilial.Text)= ''   then
    Begin
      QrSeguroCarga.SetVariable('FILIAL',Null);
      QrSeguroCarga1.SetVariable('FILIAL',Null);
    End
    Else
    Begin
      QrSeguroCarga.SetVariable('FILIAL',FLiberaFrete.MeFilial.Text);
      QrSeguroCarga1.SetVariable('FILIAL',FLiberaFrete.MeFilial.Text);
    End;

    Case RGTipoNota.ItemIndex of
      0:
      Begin
        QrSeguroCarga.SetVariable('IND_ENT_SAIDA','E');
        QrSeguroCarga1.SetVariable('IND_ENT_SAIDA','E');
        wstrEntSaida := 'Entrada';
      End;
      1:
      Begin
        QrSeguroCarga.SetVariable('IND_ENT_SAIDA','S');
        QrSeguroCarga1.SetVariable('IND_ENT_SAIDA','S');
        wstrEntSaida := 'Saída';
      End;
      2:
      Begin
        QrSeguroCarga.SetVariable('IND_ENT_SAIDA', Null);
        QrSeguroCarga1.SetVariable('IND_ENT_SAIDA', Null);
        wstrEntSaida := 'Entrada/Saída';
      End
    End;
    QrSeguroCarga.Open;
    QrSeguroCarga1.Open;

    If FRSeguroCargas = Nil then
      FRSeguroCargas := TFRSeguroCargas.Create(Application);
    FRSeguroCargas.QRLTitulo.Caption := 'Rel de Notas de ' + wstrEntSaida + ' para Seguradora de '+FLiberaFrete.MeDtInicial.Text + ' ate '+FLiberaFrete.MeDtFinal.Text;
    If FRSeguroCargas1 = Nil then
      FRSeguroCargas1 := TFRSeguroCargas1.Create(Application);
    FRSeguroCargas1.QRLTitulo.Caption := FRSeguroCargas.QRLTitulo.Caption;
    FRSeguroCargas.QRCompositeReport1.Preview;
    QrSeguroCarga.Close;
    QrSeguroCarga1.Close;
  End;

end;

procedure TFLiberaFrete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FLiberaFrete := Nil;
end;

end.
