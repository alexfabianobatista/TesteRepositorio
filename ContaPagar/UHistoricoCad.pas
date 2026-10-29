unit UHistoricoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBDirceu, ActnList, IdBaseComponent, IdComponent,variants,
  IdTCPConnection, IdTCPClient, IdHTTP;


//  Grids, DBGrids,  Menus;


type
  TFHistoricoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    BtHistoricoContabil: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    BtCodContabilCredor: TSpeedButton;
    BtCodContabilDeb: TSpeedButton;
    Historico1: TMenuItem;
    Label3: TLabel;
    BtCodHistoricoCaixa: TSpeedButton;
    DBEdit9: TDBEdit;
    Label4: TLabel;
    DBEdit11: TDBEdit;
    BtDepartamentoCons: TSpeedButton;
    DBRadioGroup4: TDBRadioGroup;
    DBEdit12: TDBEdit;
    Label5: TLabel;
    SBCentroCusto: TSpeedButton;
    DBRadioGroup5: TDBRadioGroup;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    DBRadioGroup8: TDBRadioGroup;
    DBIndEmite: TDBRadioGroup;
    DBRadioGroup9: TDBRadioGroup;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    PlanoContaCaixa1: TMenuItem;
    DbTipoCustoPollyana: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure BtHistoricoContabilClick(Sender: TObject);
    procedure BtCodContabilCredorClick(Sender: TObject);
    procedure BtCodContabilDebClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure Historico1Click(Sender: TObject);
    procedure BtCodHistoricoCaixaClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtDepartamentoConsClick(Sender: TObject);
    procedure SBCentroCustoClick(Sender: TObject);
    procedure PlanoContaCaixa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistoricoCad: TFHistoricoCad;

implementation

uses UHistorico_cl, UHistoricoCons, UHistContabilCons, UHistContabil_cl,
  UParamSistema_cl, UPlanoContaCons, UPlanoConta_cl, UHistoricoParam,
  URHistorico, UCaixa_cl, UDepartamentoCons, UOracle_cl, UDepartamento_cl,
  UCentroCustoCons, UCentroCusto_cl, UrHistoricosPlanoConta;

{$R *.DFM}

procedure TFHistoricoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMHistorico do
    Begin
      QHistorico.Open;
      Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
        4: Begin
           QHistoricoCod_Contabil_Cred.EditMask := '#.##.##.######;0;';
           QHistoricoCod_Contabil_Deb.EditMask := '#.##.##.######;0;';
           End;
        5: Begin
           QHistoricoCod_Contabil_Cred.EditMask := '#.##.##.##.######;0;';
           QHistoricoCod_Contabil_Deb.EditMask := '#.##.##.##.######;0;';
           End;
        6: Begin
           QHistoricoCod_Contabil_Cred.EditMask := '#.##.##.##.##.######;0;';
           QHistoricoCod_Contabil_Deb.EditMask := '#.##.##.##.##.######;0;';
           End;
      End;
  End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'POLLYANA' Then
     DbTipoCustoPollyana.Visible := True;
end;

procedure TFHistoricoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
     FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal = MrOk then
  Begin
    With DMHistorico do
    Begin
      QHistorico.Close;
      QHistorico.SetVariable('PK',QHistoricoConsCod_Historico.Value);
      QHistorico.Open;
    End;
  End;
end;

procedure TFHistoricoCad.SBConfirmarClick(Sender: TObject);
var
  wCodigo:Integer;
begin
  wCodigo:=DMHistorico.QHistoricoCod_Historico.Value;
  inherited;
  DMHistorico.QHistorico.Close;
  DMHistorico.QHistorico.SetVariable('PK',wCodigo);
  DMHistorico.QHistorico.Open;
end;

procedure TFHistoricoCad.SBCancelarClick(Sender: TObject);
var
  wCodigo:Integer;
begin
  wCodigo:=DMHistorico.QHistoricoCod_Historico.Value;
  inherited;
  DMHistorico.QHistorico.Close;
  DMHistorico.QHistorico.SetVariable('PK',wCodigo);
  DMHistorico.QHistorico.Open;
end;


procedure TFHistoricoCad.BtHistoricoContabilClick(Sender: TObject);
begin
  inherited;
  If FHistContabilCons=Nil then
    FHistContabilCons:=TFHistContabilCons.Create(Application);
  If FHistContabilCons.ShowModal=mrOk then
    DMHistorico.QHistoricoCod_Historico_Contabil.Value:=DMHistContabil.QHistContabilConsCod_Historico_Contabil.Value;
end;

procedure TFHistoricoCad.BtCodContabilCredorClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
     DMHistorico.QHistoricoCod_Contabil_Cred.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
end;

procedure TFHistoricoCad.BtCodContabilDebClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  If FPlanoContaCons.ShowModal=mrOk then
    Begin
      DMHistorico.QHistoricoCod_Contabil_Deb.Value:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
    End;
end;

procedure TFHistoricoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DsInsert,DsEdit] then
    Begin
      BtCodContabilCredor.Enabled:= True;
      BtCodContabilDeb.Enabled   := True;
      BtHistoricoContabil.Enabled:= True;
      BtCodHistoricoCaixa.Enabled:= True;
      BtDepartamentoCons.Enabled := True;
      SBCentroCusto.Enabled :=True;
    End
  Else
    Begin
      BtCodContabilCredor.Enabled:= False;
      BtCodContabilDeb.Enabled   := False;
      BtHistoricoContabil.Enabled:= False;
      BtCodHistoricoCaixa.Enabled:= False;
      BtDepartamentoCons.Enabled := False;
      SBCentroCusto.Enabled := False;
    End;
end;

procedure TFHistoricoCad.Historico1Click(Sender: TObject);
Begin
  Inherited;
  If FHistoricoParam=Nil then
    FHistoricoParam:=TFHistoricoParam.Create(Application);
  FHistoricoParam.PGRelatorio.Pages[0].TabVisible:=True;
  If FHistoricoParam.ShowModal = mrOk then
   Begin
     With DMHistorico do
      Begin
        QRHistorico.Close;
        Case FHistoricoParam.RgSituacao.ItemIndex of
          0 : QRHistorico.SetVariable('IND_SITUACAO','SIM');
          1 : QRHistorico.SetVariable('IND_SITUACAO','NAO');
          2 : QRHistorico.SetVariable('IND_SITUACAO',Null);
        End;
        Case FHistoricoParam.RgOperacao.ItemIndex of
          0 : QRHistorico.SetVariable('IND_OPERACAO','+');
          1 : QRHistorico.SetVariable('IND_OPERACAO','-');
          2 : QRHistorico.SetVariable('IND_OPERACAO',Null);
        End;
        QRHistorico.SQL[QRHistorico.SQL.Count-1]:='';
        Case FHistoricoParam.RGOrdem.ItemIndex of
           0:QRHistorico.SQL.Add('ORDER BY COD_DEPARTAMENTO,DESC_HISTORICO');
           1:QRHistorico.SQL.Add('ORDER BY COD_DEPARTAMENTO,COD_HISTORICO');
        End;
        QRHistorico.Open;
      End;
      If FRHistorico=Nil then
         FRHistorico:=TFRHistorico.Create(Application);
      If FHistoricoParam.RGPreview.ItemIndex=0 then
         FRHistorico.QRPrimario.Preview
      Else
         FRHistorico.QRPrimario.Print;
      DMHistorico.QRHistorico.Close;
   End;
End;

procedure TFHistoricoCad.BtCodHistoricoCaixaClick(Sender: TObject);
begin
  inherited;
  If FHistoricoCons=Nil then
    FHistoricoCons:=TFHistoricoCons.Create(Application);
  If FHistoricoCons.ShowModal=mrOk then
  With DMHistorico do
    QHistoricoCod_Historico_Caixa.Value:=QHistoricoConsCod_Historico.Value;
end;

procedure TFHistoricoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (8);
end;

procedure TFHistoricoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMHistorico.QHistorico.Close;
  Action := caFree;
  FHistoricoCad := Nil;
end;

procedure TFHistoricoCad.BtDepartamentoConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons=Nil then
     FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
     DMHistorico.QHistoricoCOD_DEPARTAMENTO.Value := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
end;

procedure TFHistoricoCad.SBCentroCustoClick(Sender: TObject);
begin
  inherited;
 If FCentroCustoCons = Nil then
    FCentroCustoCons:= TFCentroCustoCons.Create(Application);
 If FCentroCustoCons.Showmodal = MrOk then
    DMHistorico.QHistoricoCod_Centro_Custo.Value := DMCentroCusto.QCentroCustoConsCod_Centro_Custo.Value;
end;

procedure TFHistoricoCad.PlanoContaCaixa1Click(Sender: TObject);
begin
  inherited;
  DMHistorico.QRPlanoContasCaixa.Close;
  DMHistorico.QRPlanoContasCaixa.Open;
  If FrHistoricosPlanoConta=Nil then
     FrHistoricosPlanoConta:=TFrHistoricosPlanoConta.Create(Application);
  FrHistoricosPlanoConta.QRPrimario.Preview;
  DMHistorico.QRPlanoContasCaixa.Close;
end;

end.
