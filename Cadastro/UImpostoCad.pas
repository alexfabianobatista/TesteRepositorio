unit UImpostoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFImpostoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    SBFinalidade: TSpeedButton;
    DBDirceu1: TDBDirceu;
    SBContaCredito: TSpeedButton;
    DBDirceu19: TDBDirceu;
    SBContaDebito: TSpeedButton;
    DBDirceu2: TDBDirceu;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    procedure SBFinalidadeClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBContaCreditoClick(Sender: TObject);
    procedure SBContaDebitoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImpostoCad: TFImpostoCad;

implementation

uses UImposto_cl, UFinalidadeCons, UFinalidade_cl, UParamSistema_cl,
  UPlanoContaCons, UPlanoConta_cl, UImpostoCons;

{$R *.DFM}

procedure TFImpostoCad.SBFinalidadeClick(Sender: TObject);
begin
  inherited;
  IF FFinalidadeCons = nil then
    FFinalidadeCons := TFFinalidadeCons.create(application);

  if FFinalidadeCons.showmodal = mrok then
    DMImposto.QImpostoCOD_FINALIDADE.Value := DMFinalidade.QFinalidadeConsCOD_FINALIDADE.Value;
end;

procedure TFImpostoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsInsert, dsEdit] then
  begin
    SBFinalidade.enabled   := true;
    SBContaCredito.Enabled := true;
    SBContaDebito.Enabled  := true;
  end
  else
  begin
    SBFinalidade.Enabled   := false;
    SBContaCredito.Enabled := false;
    SBContaDebito.Enabled  := false;
  end;
end;

procedure TFImpostoCad.FormCreate(Sender: TObject);
var wMask : string;
begin
  inherited;
  //--VERIFICA OS GRAUS CONTÁBEIS PARA APLICAR A MÁSCARA CORRETA------------
  wMask := '';
  Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
    4: wMask := '#.##.##.######;0;';
    5: wMask := '#.##.##.##.######;0;';
    6: wMask := '#.##.##.##.##.######;0;';
  End;
  DMImposto.QImpostoCONTA_CREDITO.EditMask := wMask;
  DMImposto.QImpostoCONTA_DEBITO.EditMask := wMask;

  DMImposto.QImposto.Close;
  DMImposto.QImposto.Open;
end;

procedure TFImpostoCad.SBContaCreditoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMImposto.QImpostoCONTA_CREDITO.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFImpostoCad.SBContaDebitoClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons = Nil then
    FPlanoContaCons := TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal = mrOk then
    DMImposto.QImpostoCONTA_DEBITO.Value := DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFImpostoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FImpostoCons = nil then
    FImpostoCons := TFImpostoCons.create(application);

  if FImpostoCons.showmodal = mrok then
  begin
    DMImposto.QImposto.close;
    DMImposto.QImposto.SetVariable('PK', DMImposto.QImpostoConsCOD_IMPOSTO.Value);
    DMImposto.QImposto.open;
  end;
end;

end.
