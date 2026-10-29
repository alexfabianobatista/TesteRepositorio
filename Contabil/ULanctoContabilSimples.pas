unit ULanctoContabilSimples;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFLanctoContabilSimples = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBRGOperacao: TDBRadioGroup;
    Label19: TLabel;
    MECodReduzido: TMaskEdit;
    MENumConta: TMaskEdit;
    Label18: TLabel;
    BtPlanoContas: TBitBtn;
    BtFilial: TBitBtn;
    BtHistContabil: TBitBtn;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    procedure MECodReduzidoExit(Sender: TObject);
    procedure MENumContaExit(Sender: TObject);
    procedure BtPlanoContasClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtHistContabilClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLanctoContabilSimples: TFLanctoContabilSimples;

implementation

uses UPlanilha_cl, UParamSistema_cl, UOracle_cl, UPlanoConta_cl,UBiblioteca,
  UPlanoContaCons, UFilialCons, UFilial_cl, UHistContabilCons,
  UHistContabil_cl, ULanctoContabilCons, UUsuario_cl;

{$R *.DFM}

procedure TFLanctoContabilSimples.MECodReduzidoExit(Sender: TObject);
var
   vTestaNulo:String;
   wFilial_Plano : Real;
begin
  inherited;
  if DSPrimario.State in [DsInsert,DsEdit] then
    begin
      If DMParamSistema.QParamSistemaIND_TIPO_PLANO_CONTA.Value='UNICO' then
         wFilial_Plano := 1
      Else
         wFilial_Plano := DMPlanilha.QLanctoContabilCadCOD_FILIAL.Value;

      if Trim(MECodReduzido.Text)<>'' then
        begin
          vTestaNulo:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzido.Text+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
          if vTestaNulo<>'' then
            begin
              If Trim(MECodReduzido.Text) <> '' Then
                If DMOracle.BuscaNome('SELECT IND_LIBERADO_USO FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzido.Text+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano)) = 'NAO' Then
                 Begin
                   MeCodReduzido.SetFocus;
                   Raise Exception.Create('Conta não liberado para uso');
                 End;
              DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value:=StrToInt(vTestaNulo);
              MENumConta.Text:=DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzido.Text+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
            end;
        end
      else
        begin
          DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Clear;
          MENumConta.Clear;
        end;
    end;

end;

procedure TFLanctoContabilSimples.MENumContaExit(Sender: TObject);
var
   vGrau:Integer;
   vTestaNulo:String;
   wFilial_Plano : Real;
begin
  inherited;
  vGrau:=0;
  With DMPlanoConta do
  Begin
    QPlanoConta.Open;
    Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
       4: vGrau:=11;
       5: vGrau:=13;
       6: vGrau:=15;
    End;
  End;
  if DSPrimario.State in [DsInsert,DsEdit] then
    begin
      If DMParamSistema.QParamSistemaIND_TIPO_PLANO_CONTA.Value='UNICO' then
         wFilial_Plano := 1
      Else
         wFilial_Plano := DMPlanilha.QLanctoContabilCadCOD_FILIAL.Value;

      if ((Trim(Bib.LimpaString(MENumConta.Text,'.')))<>'') and
         ((Length(Trim(Bib.LimpaString(MENumConta.Text,'.')))) = vGrau) then
        begin
          vTestaNulo:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Chr(39)+Bib.LimpaString(MENumConta.Text,'.')+Chr(39)+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
          if vTestaNulo<>''  then
            begin
              If Bib.LimpaString(MENumConta.Text,'.') <> '' Then
                If DMOracle.BuscaNome('SELECT IND_LIBERADO_USO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Chr(39)+Bib.LimpaString(MENumConta.Text,'.')+Chr(39)+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano)) = 'NAO' Then
                 Begin
                   MENumConta.SetFocus;
                   Raise Exception.Create('Conta não liberado para uso');
                 End;
              DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value:=StrToInt(vTestaNulo);
              MECodreduzido.Text:=DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Chr(39)+Bib.LimpaString(MENumConta.Text,'.')+Chr(39)+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
            end;
        end
      else
        begin
          DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Clear;
          MECodreduzido.Clear;
        end;
    end;
end;

procedure TFLanctoContabilSimples.BtPlanoContasClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  FPlanoContaCons.MECodFilial.Text:=FloatToStr(DMPlanilha.QLanctoContabilCadCod_Filial.Value);
  FPlanoContaCons.MECodFilial.ParentColor:=True;
  FPlanoContaCons.MECodFilial.ReadOnly:=True;
  if FPlanoContaCons.ShowModal=mrOk then
   Begin
     If DMPlanoConta.QPlanoContaConsInd_Liberado_Uso.Value = 'NAO' Then
        Raise exception.Create('Conta não liberado para uso');
     DMPlanilha.QLanctoContabilCadCod_Plano_Conta.value:=DMPlanoConta.QPlanoContaConsCod_Plano_Conta.Value;
   End;  
  DMPlanoConta.QPlanoContaCons.Close;
  FPlanoContaCons.MECodFilial.Clear;
  FPlanoContaCons.MECodFilial.Color:=clWindow;
  FPlanoContaCons.MECodFilial.ReadOnly:=False;

end;

procedure TFLanctoContabilSimples.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.Showmodal = mrOK then
    begin
      with DMPlanilha do
        begin
          QLanctoContabilCadCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
        end;
    end;

end;

procedure TFLanctoContabilSimples.BtHistContabilClick(Sender: TObject);
begin
  inherited;
  if FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  if FHistContabilCons.Showmodal = mrOK then
    begin
      with DMPlanilha do
        begin
          QLanctoContabilCadCod_Historico_contabil.Value:=DMHistContabil.QHistContabilConsCod_historico_COntabil.Value;
        end;
    end;

end;

procedure TFLanctoContabilSimples.FormActivate(Sender: TObject);
begin
  inherited;
  With DMPlanoConta do
  Begin
    QPlanoConta.Open;
    Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
       4: MENumConta.EditMask := '#.##.##.######;0;';
       5: MENumConta.EditMask := '#.##.##.##.######;0;';
       6: MENumConta.EditMask := '#.##.##.##.##.######;0;';
    End;
  End;
  DMPlanilha.QLanctoContabilCad.Open;
//  DMPlanilha.QSomaGrid.Open;
//  DSPrimario.AutoEdit:=False;
//  MELocaliza.Visible:=False;

end;

procedure TFLanctoContabilSimples.SBConsultaClick(Sender: TObject);
Var wSql : String;
begin
  inherited;
  if FlanctoContabilCons=Nil then
    FlanctoContabilCons:=TFlanctoContabilCons.Create(Application);
  if FlanctoContabilCons.ShowModal = mrOk then
    begin
      DMPlanilha.QLanctoContabilCad.Close;
      DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
      DMPlanilha.QLanctoContabilCad.SQL.Add('COD_LANCTO_CONTABIL = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Lancto_Contabil.Value));
      DMPlanilha.QLanctoContabilCad.Open;
    end;

end;

procedure TFLanctoContabilSimples.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  MENumConta.Text:=DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+FloatToStr(DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value));
  MECodReduzido.Text:=DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+FloatToStr(DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value));
end;

procedure TFLanctoContabilSimples.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if (DSPrimario.State in [DsInsert,DsEdit]) or
     (DMOracle.DBCemapa.InTransaction) then
    begin
      BtHistContabil.Enabled:=True;
      BtPlanoContas.Enabled:=True;
      BtFilial.Enabled:=True;
      MeNumConta.ReadOnly:=False;
      MeCodReduzido.ReadOnly:=False;
    end
  else
    begin
      BtHistContabil.Enabled:=False;
      BtPlanoContas.Enabled:=False;
      BtFilial.Enabled:=False;
      MeNumConta.ReadOnly:=True;
      MeCodReduzido.ReadOnly:=True;
    end;
end;

procedure TFLanctoContabilSimples.SBConfirmarClick(Sender: TObject);
Var wCodigo : Real;
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMPlanilha.QLanctoContabilCadCOD_FILIAL.Text),'CONTABIL');
  If Not DMUsuario.ContabilPrivilegiado Then  // usuario nao privilegiado para lancto contabil
    If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Text <> '' Then
       If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Value > DMPlanilha.QLanctoContabilCadDt_Lancamento.Value Then
          Raise Exception.Create('Contabilidade Já Fechada Neste Período - Data Lançamento');
  inherited;
  If DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.Commit;
  wCodigo := DMPlanilha.QLanctoContabilCadCod_Lancto_Contabil.Value;
  DMPlanilha.QLanctoContabilCad.Close;
  DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
  DMPlanilha.QLanctoContabilCad.SQL.Add('COD_LANCTO_CONTABIL = '+FloatToStr(wCodigo));
  DMPlanilha.QLanctoContabilCad.Open;
end;

procedure TFLanctoContabilSimples.SBCancelarClick(Sender: TObject);
begin
  inherited;
  If DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.RollBack;

end;

procedure TFLanctoContabilSimples.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(21); 
end;

procedure TFLanctoContabilSimples.SBExcluirClick(Sender: TObject);
begin
  If Not DMUsuario.ContabilPrivilegiado Then
     If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Text <> '' Then
        If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Value > DMPlanilha.QLanctoContabilCadDt_Lancamento.Value Then
           Raise Exception.Create('Contabilidade Já Fechada Neste Período - Data Lançamento');
  inherited;
  If DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.Commit;

end;

procedure TFLanctoContabilSimples.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPlanoConta.QPlanoConta.Close;
  DMPlanilha.QLanctoContabilCad.Close;
  Action := CaFree;
  FLanctoContabilSimples := Nil;
end;

procedure TFLanctoContabilSimples.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  If Trim(DbEdit3.Text) <> '' Then
    If DMOracle.BuscaNome('SELECT IND_LIBERADO_USO FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+Trim(DbEdit3.Text)) = 'NAO' Then
     Begin
       DBEdit3.SetFocus;
       Raise Exception.Create('Conta não liberado para uso');
     End;

end;

end.
