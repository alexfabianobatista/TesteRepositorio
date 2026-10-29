unit UFinanciamentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, OracleNavigator, ActnList, OraTeste,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFFinanciamentoCad = class(TFTCadSimples)
    DSParcela: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    SBBanco: TSpeedButton;
    DBDirceu1: TDBDirceu;
    OracleNavigator1: TOracleNavigator;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure SBBancoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
  private
    procedure AdicionaParcelas;
  public
    { Public declarations }
  end;

var
  FFinanciamentoCad: TFFinanciamentoCad;

implementation

uses UFinanciamento_cl, UBancosCons, UBancoAgencia_cl, UFinanciamentoCons,
  UFinanciamentoParcelas;

{$R *.DFM}

procedure TFFinanciamentoCad.SBBancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := TFBancosCons.create(application);

  if FBancosCons.showmodal = mrok then
    DMFinanciamento.QFinanciamentoCabCOD_BANCO_AGENCIA.Value := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Value;

end;

procedure TFFinanciamentoCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMFinanciamento.QFinanciamentoCab.close;
  DMFinanciamento.QFinanciamentoCab.open;
  DMFinanciamento.QFinanciamentoParc.close;
  DMFinanciamento.QFinanciamentoParc.open;
end;

procedure TFFinanciamentoCad.DSPrimarioStateChange(Sender: TObject);
  var b: boolean;
begin
  inherited;
  b := DSPrimario.State in [dsinsert, dsedit];
  SBBanco.Enabled := b;
  OracleNavigator1.Enabled := b;
end;

procedure TFFinanciamentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FFinanciamentoCons = Nil Then
     FFinanciamentoCons := TFFinanciamentoCons.Create(Application);
  If FFinanciamentoCons.ShowModal = MrOk Then
   Begin
     DMFinanciamento.QFinanciamentoCab.Close;
     DMFinanciamento.QFinanciamentoCab.SetVariable('Pk',DMFinanciamento.QFinanciamentoConsCod_Financiamento_Cab.Value);
     DMFinanciamento.QFinanciamentoCab.Open;
   End;
end;

procedure TFFinanciamentoCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  if (DSPrimario.State in [dsInsert, dsEdit]) then
    if(PageControl1.ActivePage.TabIndex = 1) and (DMFinanciamento.QFinanciamentoParc.RecordCount = 0) then
    begin
      if FFinanciamentoParcelas = nil then
        FFinanciamentoParcelas := TFFinanciamentoParcelas.Create(Application);
      if FFinanciamentoParcelas.ShowModal = mrOK then
        AdicionaParcelas;
      FFinanciamentoParcelas.LimpaParcelas;
    end;
end;

procedure TFFinanciamentoCad.AdicionaParcelas;
begin
  
  with DMFinanciamento do
  begin
    CDSGerarParcelas.First;
    while (not CDSGerarParcelas.eof) do
    begin
      QFinanciamentoParc.Insert;
      QFinanciamentoParcDT_VENCIMENTO.Value := CDSGerarParcelasDT_VENCIMENTO.Value;
      QFinanciamentoParcVAL_PARCELA.Value := CDSGerarParcelasVL_PARCELA.value;
      QFinanciamentoParc.Post;
      CDSGerarParcelas.Next;
    end;
  end;
end;

procedure TFFinanciamentoCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  if not (DSPrimario.State in [dsEdit, dsInsert]) then
    (DSPrimario.DataSet as TOracleDataSet1).Session.Commit;
end;

procedure TFFinanciamentoCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  (DSPrimario.DataSet as TOracleDataSet1).Session.Commit;
end;

procedure TFFinanciamentoCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  if DSParcela.State in [dsEdit, dsInsert] then
    DSParcela.DataSet.Cancel;
  inherited;
  (DSPrimario.DataSet as TOracleDataSet1).Session.Rollback;
  DSPrimario.DataSet.Refresh;
  DSParcela.DataSet.Refresh;
end;

end.
