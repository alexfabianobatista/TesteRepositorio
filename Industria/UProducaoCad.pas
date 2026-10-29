unit UProducaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, Buttons, DBCtrls, ImgList, Db, Menus, ComCtrls,
  Mask, ExtCtrls, variants, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFProducaoCad = class(TFTCadSimples)
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
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    BtConsFilial: TBitBtn;
    DBEdit9: TDBEdit;
    BitBtn1: TBitBtn;
    DBEdit10: TDBEdit;
    BitBtn2: TBitBtn;
    DBEdit11: TDBEdit;
    Produo1: TMenuItem;
    ProduoSintetico1: TMenuItem;
    ResumodaProduoporTurno1: TMenuItem;
    RelatriodeProduoEstabelecida1: TMenuItem;
    procedure BtConsFilialClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Produo1Click(Sender: TObject);
    procedure ProduoSintetico1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure ResumodaProduoporTurno1Click(Sender: TObject);
    procedure RelatriodeProduoEstabelecida1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProducaoCad: TFProducaoCad;

implementation

uses UBoletim_cl, UFilialCons, UFilial_cl, UProdutoCons, UProduto_cl,
     UTurnoCons, UTurno_cl, UProducaoCons, UTurnoParam, URProducaoA,
     UOracle_cl, URProducaoS, URProducaoTurnProd, URResumo_Prod_Turno,
  UBoletimParam, URProducaoEstabelecida;

{$R *.DFM}

procedure TFProducaoCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QProducaoCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
  End;

end;

procedure TFProducaoCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  With DMBoletim do
    QProducaoCod_Produto.Value := Trunc(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFProducaoCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  If FTurnoCons.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QProducaoCod_Turno.Value := DMTurno.QTurnoAllCod_Turno.Value;
  End;

end;

procedure TFProducaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMBoletim do
  Begin
    QProducao.Open;
  End;

end;

procedure TFProducaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FProducaoCons = Nil Then
    FProducaoCons := TFProducaoCons.Create(Application);
  If FProducaoCons.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QProducao.Close;
    QProducao.SetVariable('PK',QProducaoConsCod_Producao.Value);
    QProducao.Open;
  End;

end;

procedure TFProducaoCad.Produo1Click(Sender: TObject);
begin
  inherited;
  If FTurnoParam = Nil then
    FTurnoParam := TFTurnoParam.Create(Application);
  FTurnoParam.PGRelatorio.Pages[1].TabVisible := True;
  If FTurnoParam.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QRProducaoA.Close;
    QRProducaoA.SetVariable('DATA_I',StrToDate(FTurnoParam.ME1DataI.Text));
    QRProducaoA.SetVariable('DATA_F',StrToDate(FTurnoParam.ME1DataF.Text));
    If Trim(FTurnoParam.Me1Filial.Text) = '' then
      QRProducaoA.SetVariable('FILIAL',Null)
    Else
      QRProducaoA.SetVariable('FILIAL',FTurnoParam.ME1Filial.Text);
    If Trim(FTurnoParam.Me1Turno.Text) = '' then
      QRProducaoA.SetVariable('TURNO',Null)
    Else
      QRProducaoA.SetVariable('TURNO',FTurnoParam.ME1Turno.Text);
    If Trim(FTurnoParam.Me1Produto.Text) = '' then
       QRProducaoA.SetVariable('PRODUTO',Null)
    Else
       QRProducaoA.SetVariable('PRODUTO',FTurnoParam.ME1Produto.Text);

    QRProducaoA.Open;
    If FRProducaoA = Nil then
      FRProducaoA := TFRProducaoA.Create(Application);
    FRProducaoA.QRLTitulo.Caption := 'Analítico - Lançamentos da Produção no periodo '
                                           +FTurnoParam.ME1DataI.Text
                                           +' até '+FTurnoParam.ME1DataF.Text;

    FRProducaoA.QRLFilial.Caption := 'Filial: ' + FTurnoParam.Ed1Filial.Text;

    If FTurnoParam.RGPreview.ItemIndex = 0 then
       FRProducaoA.QRPrimario.Preview
    Else
       FRProducaoA.QRPrimario.Print;

    QRProducaoA.Close;
  End;

end;

procedure TFProducaoCad.ProduoSintetico1Click(Sender: TObject);
begin
  inherited;
  If FTurnoParam = Nil then
    FTurnoParam := TFTurnoParam.Create(Application);
  FTurnoParam.PGRelatorio.Pages[1].TabVisible := True;
  If FTurnoParam.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QRProducaoS.Close;
    QRProducaoS.SetVariable('DATA_I',StrToDate(FTurnoParam.ME1DataI.Text));
    QRProducaoS.SetVariable('DATA_F',StrToDate(FTurnoParam.ME1DataF.Text));
    If Trim(FTurnoParam.Me1Filial.Text) = '' then
      QRProducaoS.SetVariable('FILIAL',Null)
    Else
      QRProducaoS.SetVariable('FILIAL',FTurnoParam.ME1Filial.Text);
    If Trim(FTurnoParam.Me1Turno.Text) = '' then
      QRProducaoS.SetVariable('TURNO',Null)
    Else
      QRProducaoS.SetVariable('TURNO',FTurnoParam.ME1Turno.Text);
    If Trim(FTurnoParam.Me1Produto.Text) = '' then
       QRProducaoS.SetVariable('PRODUTO',Null)
    Else
       QRProducaoS.SetVariable('PRODUTO',FTurnoParam.ME1Produto.Text);

    QRProducaoS.Open;
    If FRProducaoS = Nil then
      FRProducaoS := TFRProducaoS.Create(Application);
    FRProducaoS.QRLTitulo.Caption := 'Sintético - Resumo da Produção no periodo '
                                           + FTurnoParam.ME1DataI.Text
                                           +' até '+FTurnoParam.ME1DataF.Text;

    FRProducaoS.QRLFilial.Caption := 'Filial: ' + FTurnoParam.Ed1Filial.Text;

    If FTurnoParam.RGPreview.ItemIndex = 0 then
       FRProducaoS.QRPrimario.Preview
    Else
       FRProducaoS.QRPrimario.Print;

    QRProducaoS.Close;
  End;

end;

procedure TFProducaoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(5);
end;

procedure TFProducaoCad.ResumodaProduoporTurno1Click(Sender: TObject);
begin
  inherited;
  If FTurnoParam = Nil then
    FTurnoParam := TFTurnoParam.Create(Application);
  FTurnoParam.PGRelatorio.Pages[3].TabVisible := True;
  If FTurnoParam.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QRResumo_Prod_Turno.Close;
    If Trim(FTurnoParam.Me3Turno.Text) = '' then
       QRResumo_Prod_Turno.SetVariable('TURNO',Null)
    Else
       QRResumo_Prod_Turno.SetVariable('TURNO',FTurnoParam.ME3Turno.Text);

    if Trim(FTurnoParam.ME3DataI.text) <> ' ' then
       QRResumo_Prod_Turno.SetVariable('DATA_I',StrToDate(FTurnoParam.ME3DataI.Text))
    else
       raise exception.create('Data Incial não pode ficar em branco');

    if Trim(FTurnoParam.ME3DataF.text) <> ' ' then
       QRResumo_Prod_Turno.SetVariable('DATA_F',StrToDate(FTurnoParam.ME3DataF.Text))
    else
       raise exception.create('Data Final não pode ficar em branco');

    QRResumo_Prod_Turno.Open;
    If FRResumo_Prod_Turno = Nil then
      FRResumo_Prod_Turno := TFRResumo_Prod_Turno.Create(Application);
    FRResumo_Prod_Turno.QRLTitulo.Caption := 'Resumo da Produção por Turno no Período '
                                           + FTurnoParam.ME3DataI.Text
                                           +' até '+FTurnoParam.ME3DataF.Text;

    If FTurnoParam.RGPreview.ItemIndex = 0 then
       FRResumo_Prod_Turno.QRPrimario.Preview
    Else
       FRResumo_Prod_Turno.QRPrimario.Print;
       QRResumo_Prod_Turno.Close;
  End;

end;

procedure TFProducaoCad.RelatriodeProduoEstabelecida1Click(
  Sender: TObject);
begin
  inherited;
  if FBoletimParam = Nil then
    FBoletimParam:= TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[4].TabVisible := True;
  if FBoletimParam.ShowModal = mrOk then
  with DMBoletim do
  begin
    QRProducaoEstabelecida.Close;
    if Trim(FBoletimParam.ME4Filial.Text) = '' then
      QRProducaoEstabelecida.SetVariable('FILIAL',Null)
    else
      QRProducaoEstabelecida.SetVariable('FILIAL',StrToInt(Trim(FBoletimParam.ME4Filial.Text)));
    If Trim(FBoletimParam.ME4ClasseInicial.text) <> '' then
      QRProducaoEstabelecida.SetVariable('CLASSE_INICIAL',FBoletimParam.ME4ClasseInicial.text)
    Else
      QRProducaoEstabelecida.SetVariable('CLASSE_INICIAL',Null);
    
    if Trim(FBoletimParam.ME4Produto.Text) = '' then
      QRProducaoEstabelecida.SetVariable('PRODUTO',Null)
    else
      QRProducaoEstabelecida.SetVariable('PRODUTO',StrToInt(Trim(FBoletimParam.ME4Produto.Text)));
    if Trim(FBoletimParam.ME4Lote.Text) = '' then
      QRProducaoEstabelecida.SetVariable('LOTE',Null)
    else
      QRProducaoEstabelecida.SetVariable('LOTE',StrToInt(Trim(FBoletimParam.ME4Lote.Text)));
    QRProducaoEstabelecida.Open;
    if FRProducaoEstabelecida = Nil then
      FRProducaoEstabelecida := TFRProducaoEstabelecida.Create(Application);
    FRProducaoEstabelecida.QRLFilial.Caption := 'Filial: '+Trim(FBoletimParam.ME4Filial.Text)+' '+FBoletimParam.Ed4Filial.Text;
    if FBoletimParam.RGPreview.ItemIndex = 0 then
       FRProducaoEstabelecida.QRPrimario.Preview
    else
      FRProducaoEstabelecida.QRPrimario.Print;
    QRProducaoEstabelecida.Close;
  end;
end;

end.
