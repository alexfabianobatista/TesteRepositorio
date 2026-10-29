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
    Label112: TLabel;
    MeOperacao: TMaskEdit;
    BtOperacao: TBitBtn;
    EdOperacao: TEdit;
    RgOpcao: TRadioGroup;
    MEVAL_SEGURO: TMaskEdit;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    RGSeguro: TRadioGroup;
    MEEstado: TMaskEdit;
    Label4: TLabel;
    SB1Estado: TSpeedButton;
    procedure MEFilialExit(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure SBProcuraClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MeOperacaoExit(Sender: TObject);
    procedure BtOperacaoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SB1EstadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiberaFrete: TFLiberaFrete;

implementation

uses UNotaSaida_cl, UFilial_cl, UFilialCons, UOracle_cl, UParamSistema_cl,
  URSeguroCargas, URelatorioVenda_cl, UUsuario_cl, URSeguroCargas1,
  UOperacaoCons, UOperacao_cl, UEstadoCons, UEstado_cl;

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
    If Trim(FLiberaFrete.MeOperacao.Text)= ''   then
      QLiberaSeguro.SetVariable('COD_OPERACAO',Null)
    Else
      QLiberaSeguro.SetVariable('COD_OPERACAO',StrToFloat(FLiberaFrete.MeOperacao.Text));
    Case RGTipoNota.ItemIndex of
      0: QLiberaSeguro.SetVariable('IND_ENT_SAIDA','E');
      1: QLiberaSeguro.SetVariable('IND_ENT_SAIDA','S');
      2: QLiberaSeguro.SetVariable('IND_ENT_SAIDA', Null);
    End;
    QLiberaSeguro.SetVariable('VAL_SEGURO',StrToFloat(FLiberaFrete.MEVAL_SEGURO.Text));

    if trim(MEEstado.Text) <> '' then
      QLiberaSeguro.SetVariable('COD_ESTADO',trim(MEEstado.Text))
    else
      QLiberaSeguro.SetVariable('COD_ESTADO',null);

    if RGSeguro.ItemIndex = 1 then
      QLiberaSeguro.SetVariable('IND_SEGURO','NAO')
    else
      QLiberaSeguro.SetVariable('IND_SEGURO','SIM');

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
var wstrEntSaida : String;
begin
  With DMRelatorio_Venda do
  Begin
    If RgOpcao.ItemIndex = 0 Then
    Begin
      QrSeguroCarga.Close;
      If Trim(FLiberaFrete.MeDtInicial.Text)= ''   then
         QrSeguroCarga.SetVariable('DATA_I',Null)
      Else
        QrSeguroCarga.SetVariable('DATA_I',FLiberaFrete.MeDtInicial.Text);

      If Trim(FLiberaFrete.MeDtFinal.Text)= ''   then
        QrSeguroCarga.SetVariable('DATA_F',Null)
      Else
        QrSeguroCarga.SetVariable('DATA_F',FLiberaFrete.MeDtFinal.Text);

      If Trim(FLiberaFrete.MeFilial.Text)= ''   then
        QrSeguroCarga.SetVariable('FILIAL',Null)
      Else
        QrSeguroCarga.SetVariable('FILIAL',FLiberaFrete.MeFilial.Text);

      If Trim(FLiberaFrete.MeOperacao.Text)= ''   then
        QrSeguroCarga.SetVariable('COD_OPERACAO',Null)
      Else
        QrSeguroCarga.SetVariable('COD_OPERACAO',StrToFloat(FLiberaFrete.MeOperacao.Text));
      Case RGTipoNota.ItemIndex of
        0: Begin
            QrSeguroCarga.SetVariable('IND_ENT_SAIDA','E');
            wstrEntSaida := 'Entrada';
           End;
        1: Begin
            QrSeguroCarga.SetVariable('IND_ENT_SAIDA','S');
            wstrEntSaida := 'Saída';
           End;
        2: Begin
            QrSeguroCarga.SetVariable('IND_ENT_SAIDA', Null);
            wstrEntSaida := 'Entrada/Saída';
           End
      End;
      QrSeguroCarga.Open;
      If FRSeguroCargas = Nil then
        FRSeguroCargas := TFRSeguroCargas.Create(Application);
      FRSeguroCargas.QRLTitulo.Caption := 'Rel de Notas de ' + wstrEntSaida + ' para Seguradora de '+FLiberaFrete.MeDtInicial.Text + ' ate '+FLiberaFrete.MeDtFinal.Text;
      FRSeguroCargas.QrPrimario.Preview;
      QrSeguroCarga.Close;
    End
   Else
    Begin
      QrSeguroCarga1.Close;
      If Trim(FLiberaFrete.MeDtInicial.Text)= ''   then
         QrSeguroCarga1.SetVariable('DATA_I',Null)
      Else
        QrSeguroCarga1.SetVariable('DATA_I',FLiberaFrete.MeDtInicial.Text);

      If Trim(FLiberaFrete.MeDtFinal.Text)= ''   then
        QrSeguroCarga1.SetVariable('DATA_F',Null)
      Else
        QrSeguroCarga1.SetVariable('DATA_F',FLiberaFrete.MeDtFinal.Text);

      If Trim(FLiberaFrete.MeFilial.Text)= ''   then
        QrSeguroCarga1.SetVariable('FILIAL',Null)
      Else
        QrSeguroCarga1.SetVariable('FILIAL',FLiberaFrete.MeFilial.Text);

      If Trim(FLiberaFrete.MeOperacao.Text)= ''   then
        QrSeguroCarga1.SetVariable('COD_OPERACAO',Null)
      Else
        QrSeguroCarga1.SetVariable('COD_OPERACAO',StrToFloat(FLiberaFrete.MeOperacao.Text));

      Case RGTipoNota.ItemIndex of
        0: Begin
            QrSeguroCarga1.SetVariable('IND_ENT_SAIDA','E');
            wstrEntSaida := 'Entrada';
           End;
        1: Begin
            QrSeguroCarga1.SetVariable('IND_ENT_SAIDA','S');
            wstrEntSaida := 'Saída';
           End;
        2: Begin
            QrSeguroCarga1.SetVariable('IND_ENT_SAIDA', Null);
            wstrEntSaida := 'Entrada/Saída';
           End
      End;
      QrSeguroCarga1.Open;
      If FRSeguroCargas1 = Nil then
        FRSeguroCargas1 := TFRSeguroCargas1.Create(Application);
      FRSeguroCargas1.QRLTitulo.Caption := 'Rel de Notas de ' + wstrEntSaida + ' para Seguradora de '+FLiberaFrete.MeDtInicial.Text + ' ate '+FLiberaFrete.MeDtFinal.Text;
      FRSeguroCargas1.QRPrimario.Preview;
      QrSeguroCarga1.Close;
    End;
  End;

end;

procedure TFLiberaFrete.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FLiberaFrete := Nil;
end;

procedure TFLiberaFrete.MeOperacaoExit(Sender: TObject);
begin
  If Trim(MeOperacao.Text) <> '' Then
    EdOperacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO',
                                           'COD_OPERACAO = '+Trim(MeOperacao.Text))
  Else
    EdOperacao.Text := 'Todos';

end;

procedure TFLiberaFrete.BtOperacaoClick(Sender: TObject);
begin
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    MeOperacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    EdOperacao.Text := DMOperacao.QOperacaoConsDesc_Operacao.Text;
  End;

end;

procedure TFLiberaFrete.SpeedButton3Click(Sender: TObject);
Var wSimNao,wComando:String;
begin
  If FLiberaFrete.RGSeguro.ItemIndex = 1 then
    wSimNao := 'SIM'
  else
    wSimNao := 'NAO';

  DMNotaSaida.QLiberaSeguro.First;
  With DMOracle do
  Begin
    while not (DMNotaSaida.QLiberaSeguro.Eof) do
    begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'UPDATE TB_NOTA_CAB SET IND_NOTA_SEGURO = '+ chr(39) + wSimNao +chr(39);
      wComando := wComando + ' WHERE COD_NOTA_CAB = '+FloatToStr(DMNotaSaida.QLiberaSeguroCod_Nota_Cab.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      DMNotaSaida.QLiberaSeguro.Next;
    end;
  End;
end;

procedure TFLiberaFrete.SB1EstadoClick(Sender: TObject);
begin
  If FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  If FEstadoCons.ShowModal = MrOk then
    MEEstado.Text := DMEstado.QEstadoConsCod_Estado.Text;
end;

procedure TFLiberaFrete.FormCreate(Sender: TObject);
begin
  Self.Constraints.MinHeight := Self.Height;
  Self.Constraints.MinWidth := Self.Width;
end;

end.
