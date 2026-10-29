unit UProcedimentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ImgList, Db,
  Menus, ComCtrls, Mask, ExtCtrls, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFProcedimentoCad = class(TFTCadSimples)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit7: TDBEdit;
    DBEdit4: TDBEdit;
    BtConsCategoria: TBitBtn;
    Label1: TLabel;
    RelaoProcedimentos1: TMenuItem;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    BTEquipamentoCons: TBitBtn;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BTEquipamentoItemCons: TBitBtn;
    BTPeriodicidadeCons: TBitBtn;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    procedure BtConsCategoriaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoProcedimentos1Click(Sender: TObject);
    procedure BTEquipamentoConsClick(Sender: TObject);
    procedure BTEquipamentoItemConsClick(Sender: TObject);
    procedure BTPeriodicidadeConsClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProcedimentoCad: TFProcedimentoCad;

implementation

uses UProcedimento_cl, UAtividadeCons, UAtividade_cl, UProcedimentoCons,
  URProcedimento, UEquipamentoCons, UEquipamento_cl, UEquipamentoItemCons,
  UPeriodicidadeCons, UPeriodicidade_cl;

{$R *.DFM}

procedure TFProcedimentoCad.BtConsCategoriaClick(Sender: TObject);
begin
  inherited;
  If FAtividadeCons = Nil then
    FAtividadeCons := TFAtividadeCons.Create(Application);
  If FAtividadeCons.showModal = mrOk then
    DMProcedimento.QProcedimentoItemCod_Atividade_cab.Value := DMAtividade.QAtividadeConsCod_Atividade_cab.Value;
end;

procedure TFProcedimentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMProcedimento.QProcedimento.Open;
  DMProcedimento.QProcedimentoItem.Open;
  FProcedimentoCad.BtConsCategoria.enabled:=false;
end;

procedure TFProcedimentoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMProcedimento.QProcedimento.Close;
  DMProcedimento.QProcedimentoItem.Close;
  DMProcedimento.QProcedimentoCons.Close;
  Action := CaFree;
  FProcedimentoCad := Nil;
end;

procedure TFProcedimentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
   If FProcedimentoCons = Nil then
    FProcedimentoCons := TFProcedimentoCons.Create(Application);
  If FProcedimentoCons.ShowModal = mrOk then
  With DMProcedimento do
  Begin
    QProcedimento.Close;
    QProcedimento.SetVariable('PK',QProcedimentoConsCod_Procedimento_cab.Value);
    QProcedimento.Open;
  End;
end;

procedure TFProcedimentoCad.RelaoProcedimentos1Click(Sender: TObject);
begin
  inherited;
  with DMProcedimento do
  begin
    QRProcedimento.Close;
    QRProcedimento.SetVariable('PK', DMProcedimento.QProcedimentoCOD_PROCEDIMENTO_CAB.Value);
    QRProcedimento.Open;

    if FRProcedimento = Nil then
      FRProcedimento := TFRProcedimento.Create(Application);
    FRProcedimento.QRPrimario.Preview;
    QRProcedimento.Close;
  End;
end;

procedure TFProcedimentoCad.BTEquipamentoConsClick(Sender: TObject);
begin
  inherited;
  If FEquipamentoCons = Nil then
    FEquipamentoCons := TFEquipamentoCons.Create(Application);
  If FEquipamentoCons.showModal = mrOk then
    DMProcedimento.QProcedimentoCod_Equipamento_cab.Value := DMEquipamento.QEquipamentoConsCod_Equipamento_cab.Value;
end;

procedure TFProcedimentoCad.BTEquipamentoItemConsClick(Sender: TObject);
begin
  inherited;
  If FEquipamentoItemCons = Nil then
    FEquipamentoItemCons := TFEquipamentoItemCons.Create(Application);
  If FEquipamentoItemCons.showModal = mrOk then
    DMProcedimento.QProcedimentoCod_Equipamento_Item.Value := DMEquipamento.QEquipamentoItemConsCod_Equipamento_Item.Value;
end;

procedure TFProcedimentoCad.BTPeriodicidadeConsClick(Sender: TObject);
begin
  inherited;
  If FPeriodicidadeCons = Nil then
    FPeriodicidadeCons := TFPeriodicidadeCons.Create(Application);
  If FPeriodicidadeCons.showModal = mrOk then
    DMProcedimento.QProcedimentoCod_Periodicidade.Value := DMPeriodicidade.QPeriodicidadeConsCod_Periodicidade.Value;  
end;

procedure TFProcedimentoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert,DSEdit]then
  begin
    BTEquipamentoCons.Enabled:=true;
    BTEquipamentoItemCons.Enabled:=true;
    BTPeriodicidadeCons.Enabled:=true;
  end
  else
  begin
    BTEquipamentoCons.Enabled:=false;
    BTEquipamentoItemCons.Enabled:=false;
    BTPeriodicidadeCons.Enabled:=false;
  end;
end;

end.
