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
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MeOperacaoExit(Sender: TObject);
    procedure BtOperacaoClick(Sender: TObject);
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
