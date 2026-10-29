unit UPlanoContaAntigoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, StdCtrls, Buttons, ExtCtrls, DBCtrls, ActnList,
  ImgList, DB, Menus, ComCtrls, Mask, DBDirceu, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFPlanoContaAntigoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    BtFilial: TBitBtn;
    DBDirceu1: TDBDirceu;
    DBRadioGroup2: TDBRadioGroup;
    BtGrupo: TBitBtn;
    BtDepartamento: TBitBtn;
    BtPlanoContaReferencial: TBitBtn;
    DBDirceu3: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBRadioGroup3: TDBRadioGroup;
    RelatrioRelacioamentodeplanodecontas1: TMenuItem;
    procedure BtFilialClick(Sender: TObject);
    procedure BtGrupoClick(Sender: TObject);
    procedure BtDepartamentoClick(Sender: TObject);
    procedure BtPlanoContaReferencialClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatrioRelacioamentodeplanodecontas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlanoContaAntigoCad: TFPlanoContaAntigoCad;

implementation

uses UPlanoConta_cl, UFilialCons, UFGrupo_CustosCons, UDepartamentoCons,
  UPlanoContaReferencialCons, UParamSistema_cl, UFilial_cl, UGrupo_cl,
  UDepartamento_cl, UPlanoContaReferencial_cl, UPlanoContaAntigoCons,
  URPlanoContas_Relacionamento;

{$R *.dfm}

procedure TFPlanoContaAntigoCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMPlanoConta.QPlanoContaAntigoCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFPlanoContaAntigoCad.BtGrupoClick(Sender: TObject);
begin
  inherited;
  If FGrupo_CustosCons = Nil then
    FGrupo_CustosCons := TFGrupo_CustosCons.Create(Application);
  If FGrupo_CustosCons.ShowModal = mrOk then
    DMPlanoConta.QPlanoContaAntigoCod_Grupo.Value := DMGrupo.QGrupo_CustoConsCod_Grupo.Value;

end;

procedure TFPlanoContaAntigoCad.BtDepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
    DMPlanoConta.QPlanoContaAntigoCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;

end;

procedure TFPlanoContaAntigoCad.BtPlanoContaReferencialClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaReferencialCons = Nil then
    FPlanoContaReferencialCons := TFPlanoContaReferencialCons.Create(Application);
  If FPlanoContaReferencialCons.ShowModal = mrOk then
    DMPlanoConta.QPlanoContaAntigoCOD_PLANO_CONTA_REFERENCIAL.Value := DmPlanoContaReferencial.QPlanoContaReferencialConsCOD_PLANO_CONTA_REFERENCIAL.Value;

end;

procedure TFPlanoContaAntigoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMPlanoConta do
  Begin
    QPlanoContaAntigo.Open;
    Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
       4: QPlanoContaAntigoNum_Plano_Conta.EditMask := '#.##.##.######;0;';
       5: QPlanoContaAntigoNum_Plano_Conta.EditMask := '#.##.##.##.######;0;';
       6: QPlanoContaAntigoNum_Plano_Conta.EditMask := '#.##.##.##.##.######;0;';
    End;
  End;
  DSPrimario.AutoEdit:=False;

end;

procedure TFPlanoContaAntigoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMPlanoConta do
    QPlanoContaAntigo.Close;
  Action := CaFree;
  FPlanoContaAntigoCad := Nil;

end;

procedure TFPlanoContaAntigoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DsInsert,DsEdit] then
   Begin
    BtFilial.Enabled:=True;
    BtGrupo.Enabled:=True;
    BtDepartamento.Enabled:=True;
    BtPlanoContaReferencial.Enabled := true;
   End
  Else
   Begin
    BtFilial.Enabled:=False;
    BtGrupo.Enabled:=False;
    BtDepartamento.Enabled:=False;
    BtPlanoContaReferencial.Enabled := False;
   End;  

end;

procedure TFPlanoContaAntigoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaAntigoCons = Nil Then
     FPlanoContaAntigoCons := TFPlanoContaAntigoCons.Create(Application);
  If FPlanoContaAntigoCons.ShowModal = mrOk then
  With DMPlanoConta do
  Begin
    QPlanoContaAntigo.Close;
    QPlanoContaAntigo.SetVariable('PK',QPlanoContaAntigoConsCod_Plano_Conta_Antigo.Value);
    QPlanoContaAntigo.Open;
//    QPlanoContaCons.Close;
  End;

end;

procedure TFPlanoContaAntigoCad.RelatrioRelacioamentodeplanodecontas1Click(
  Sender: TObject);
begin
  inherited;
  If FRPlanoContas_Relacionamento = Nil Then
     FRPlanoContas_Relacionamento := TFRPlanoContas_Relacionamento.Create(Application);
  DMPlanoConta.QrPlanoContas_Relacao.Close;
  DMPlanoConta.QrPlanoContas_Relacao.Open;   
  FRPlanoContas_Relacionamento.QRPrimario.Preview;
end;

end.
