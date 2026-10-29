unit UTurnoControle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFTurnoControle = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEDtFinal: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBRadioGroup1: TDBRadioGroup;
    Operao1: TMenuItem;
    FecharTurno1: TMenuItem;
    SBBaixa: TSpeedButton;
    Acompanhamento1: TMenuItem;
    ProduoporTurnoProduto1: TMenuItem;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure FecharTurno1Click(Sender: TObject);
    procedure DBEDtFinalExit(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Acompanhamento1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure ProduoporTurnoProduto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTurnoControle: TFTurnoControle;

implementation

uses UTurno_cl, UOracle_cl, UTurnoControleCons, UTurnoParam,
  URTurno_Acompanha, UProducaoCad, UTela_cl, UBoletim_cl, URProducaoA,
  URProducaoTurnProd;

{$R *.DFM}

procedure TFTurnoControle.FormActivate(Sender: TObject);
begin
  inherited;
  With DMTurno do
  Begin
    QTurnoControle.Open;
    QTurnoAll.Open;
  End;
  Dmturno.QTurnoAll.Refresh;
end;

procedure TFTurnoControle.FecharTurno1Click(Sender: TObject);
begin
  inherited;
  DBEDtFinal.ReadOnly := False;
  DBEDtFinal.ParentColor := False;
  DBEDtFinal.Color := clWindow;
  DBEDtFinal.SetFocus;
  DMTurno.QTurnoControleDt_Final.Value := DMOracle.DataHoraServ;
  DMTurno.QTurnoControleInd_Situacao.Value := 'F';
end;

procedure TFTurnoControle.DBEDtFinalExit(Sender: TObject);
begin
  inherited;
  DBEDtFinal.ReadOnly := True;
  DBEDtFinal.ParentColor := True;
  With DMturno do
  Begin
    If (QTurnoControle.State in [dsEdit,dsInsert])
       and (QTurnoControleDt_Final.Value > 0) Then
    Begin
      QTurnoControleInd_Situacao.Value := 'F';
      QTurnoControle.Post;
    End;
  End;
end;

procedure TFTurnoControle.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBBaixa.Enabled := (DMTurno.QTurnoControle.State in [dsEdit,dsInsert])
                      and (DMturno.QTurnoControleInd_Situacao.Value = 'A');
  MMCadSimples.Items[2].Items[0].Enabled := SBBaixa.Enabled;
end;

procedure TFTurnoControle.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FTurnoControleCons = Nil Then
    FTurnoControleCons := TFTurnoControleCons.Create(Application);
  if FTurnoControleCons.ShowModal = mrOk then
  with DMTurno do
  begin
    QTurnoControle.Close;
    QTurnoControle.SetVariable('PK',QTurnoControleConsCod_Turno_Controle.Value);
    QTurnoControle.Open;
  end;
end;

procedure TFTurnoControle.Acompanhamento1Click(Sender: TObject);
Var wTitulo : String;
begin
  inherited;
  if FTurnoParam = Nil then
    FTurnoParam := TFTurnoParam.Create(Application);
  FTurnoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FTurnoParam.ShowModal = mrOk then
  with DMTurno do
  begin
    QRAcompanha.Close;
    QRAcompanha.SetVariable('DATA_I',StrToDate(FTurnoParam.ME0DataI.Text));
    QRAcompanha.SetVariable('DATA_F',StrToDate(FTurnoParam.ME0DataF.Text));
    if Trim(FTurnoParam.ME0Filial.Text) = '' then
      QRAcompanha.SetVariable('FILIAL',Null)
    else
      QRAcompanha.SetVariable('FILIAL',FTurnoParam.ME0Filial.Text);
    if Trim(FTurnoParam.ME0Turno.Text) = '' then
      QRAcompanha.SetVariable('TURNO',Null)
    else
      QRAcompanha.SetVariable('TURNO',FTurnoParam.ME0Turno.Text);
    QRAcompanha.Open;

    // Materia prima
    case FTurnoParam.Rg0TipoProduto.ItemIndex of
        0 :
          Begin
            QRAcompanha.SetVariable('TIPO_BOLETIM','M');
            wTitulo := ' Matéria Prima de ';
          End;
        1:
          Begin
            QRAcompanha.SetVariable('TIPO_BOLETIM','P');
            wTitulo := ' Produto Acabado de ';
          End;
        2:
          Begin
            QRAcompanha.SetVariable('TIPO_BOLETIM',Null);
            wTitulo := ' Todos ';
          End;
    End;
    if FRTurno_Acompanha = Nil then
      FRTurno_Acompanha := TFRTurno_Acompanha.Create(Application);
    FRTurno_Acompanha.QRLTitulo.Caption := 'Acompanhamento da Produção de ' + wTitulo
                                           +FTurnoParam.ME0DataI.Text
                                           +' até '+FTurnoParam.ME0DataF.Text;
    if FTurnoParam.RGPreview.ItemIndex = 0 then
      FRTurno_Acompanha.QRPrimario.Preview
    else
      FRTurno_Acompanha.QRPrimario.Print;
    QRAcompanha.Close;
  end;
end;

procedure TFTurnoControle.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  if DMBoletim.pProducao Then
  begin
     if FProducaoCad = Nil then
        FProducaoCad := TFProducaoCad.Create(Application);
     FProducaoCad.ShowModal;
  end;
  DMBoletim.pProducao := False;
end;

procedure TFTurnoControle.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(3);
end;

procedure TFTurnoControle.ProduoporTurnoProduto1Click(Sender: TObject);
begin
  inherited;
  If FTurnoParam = Nil then
     FTurnoParam := TFTurnoParam.Create(Application);

  FTurnoParam.PGRelatorio.Pages[2].TabVisible := True;

  if FTurnoParam.ShowModal = mrOk then
  with DMTurno do
  begin
    QRProducaoTurnoProd.Close;
    QRProducaoTurnoProd.SetVariable('DATA_I',StrToDate(FTurnoParam.ME2DataI.Text));
    QRProducaoTurnoProd.SetVariable('DATA_F',StrToDate(FTurnoParam.ME2DataF.Text));
    If Trim(FTurnoParam.Me2Filial.Text) = '' then
      QRProducaoTurnoProd.SetVariable('COD_FILIAL',Null)
    Else
      QRProducaoTurnoProd.SetVariable('COD_FILIAL',FTurnoParam.ME2Filial.Text);
    If Trim(FTurnoParam.Me2Turno.Text) = '' then
      QRProducaoTurnoProd.SetVariable('COD_TURNO',Null)
    Else
      QRProducaoTurnoProd.SetVariable('COD_TURNO',FTurnoParam.ME2Turno.Text);
    If Trim(FTurnoParam.Me2Produto.Text) = '' then
       QRProducaoTurnoProd.SetVariable('COD_PRODUTO',Null)
    Else
       QRProducaoTurnoProd.SetVariable('COD_PRODUTO',FTurnoParam.ME2Produto.Text);

    QRProducaoTurnoProd.Open;

    If FRProducaoTurnoProd = Nil then
      FRProducaoTurnoProd := TFRProducaoTurnoProd.Create(Application);

    FRProducaoTurnoProd.QRLTitulo.Caption := 'Lançamentos da Produção no periodo '
                                           +FTurnoParam.ME2DataI.Text
                                           +' até '+FTurnoParam.ME2DataF.Text;

    FRProducaoTurnoProd.QRLFilial.Caption := FTurnoParam.Ed2Filial.Text;

    If FTurnoParam.RGPreview.ItemIndex = 0 then
       FRProducaoTurnoProd.QRPrimario.Preview
    Else
       FRProducaoTurnoProd.QRPrimario.Print;

    QRProducaoTurnoProd.Close;
  End;

end;

end.
