unit ULanctoContabilCad1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, Buttons, ImgList, Db, Menus, ComCtrls, Mask,
  ExtCtrls, DBCtrls, DBDirceu, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFLanctoContabilCad1 = class(TFTCadSimples)
    Label8: TLabel;
    BtHistContabil: TBitBtn;
    Label12: TLabel;
    Label13: TLabel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Label89: TLabel;
    SBCodFilialD: TSpeedButton;
    Label19: TLabel;
    Label18: TLabel;
    Label9: TLabel;
    MECodReduzidoD: TMaskEdit;
    MENumContaD: TMaskEdit;
    BtPlanoContasD: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    SbCodFilialC: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MeCodReduzidoC: TMaskEdit;
    MeNumContaC: TMaskEdit;
    BtPlanoContasC: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DsSecundario: TDataSource;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label5: TLabel;
    DBEdit13: TDBEdit;
    Label6: TLabel;
    DBEdit14: TDBEdit;
    Label7: TLabel;
    DBEdit15: TDBEdit;
    RazaoAnaltico1: TMenuItem;
    BalanceteAnaltico1: TMenuItem;
    DirioGeral1: TMenuItem;
    BalanoPatrimonial1: TMenuItem;
    RelatrioMovPConferncia1: TMenuItem;
    Opes1: TMenuItem;
    ViradaMs1: TMenuItem;
    ZeramentoExerccio1: TMenuItem;
    VoltaZeramentoExercicio1: TMenuItem;
    AtualizaSaldoMensal1: TMenuItem;
    DBDirceu3: TDBDirceu;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    ResumoAnual1: TMenuItem;
    procedure MECodReduzidoDExit(Sender: TObject);
    procedure MENumContaDExit(Sender: TObject);
    procedure BtPlanoContasDClick(Sender: TObject);
    procedure BtPlanoContasCClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure MeCodReduzidoCExit(Sender: TObject);
    procedure MeNumContaCExit(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure DsSecundarioDataChange(Sender: TObject; Field: TField);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BtHistContabilClick(Sender: TObject);
    procedure SbCodFilialCClick(Sender: TObject);
    procedure SBCodFilialDClick(Sender: TObject);
    procedure RazaoAnaltico1Click(Sender: TObject);
    procedure BalanceteAnaltico1Click(Sender: TObject);
    procedure DirioGeral1Click(Sender: TObject);
    procedure BalanoPatrimonial1Click(Sender: TObject);
    procedure RelatrioMovPConferncia1Click(Sender: TObject);
    procedure ViradaMs1Click(Sender: TObject);
    procedure ZeramentoExerccio1Click(Sender: TObject);
    procedure VoltaZeramentoExercicio1Click(Sender: TObject);
    procedure AtualizaSaldoMensal1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure ResumoAnual1Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLanctoContabilCad1: TFLanctoContabilCad1;

implementation

uses UPlanilha_cl, UParamSistema_cl, UOracle_cl, UPlanoConta_cl,UBiblioteca,
  UPlanoContaCons, ULanctoContabilCons, UHistContabilCons, UHistContabil_cl,
  UFilialCons, UFilial_cl, ULanctoContabilCad, UUsuario_cl;

{$R *.DFM}

procedure TFLanctoContabilCad1.MECodReduzidoDExit(Sender: TObject);
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

      if Trim(MECodReduzidoD.Text) <> '' then
        begin
          vTestaNulo:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzidoD.Text+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
          if vTestaNulo<>'' then
            begin
              If Trim(MECodReduzidoD.Text) <> '' Then
                If DMOracle.BuscaNome('SELECT IND_LIBERADO_USO FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzidoD.Text+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano)) = 'NAO' Then
                 Begin
                   MeCodReduzidoD.SetFocus;
                   Raise Exception.Create('Conta não liberado para uso');
                 End;
              DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value:=StrToInt(vTestaNulo);
              MENumContaD.Text:=DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzidoD.Text+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
            end;
        end;
{      else
        begin
          DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Clear;
          MENumContaD.Clear;
        end;  }
    end;

end;

procedure TFLanctoContabilCad1.MENumContaDExit(Sender: TObject);
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

      if ((Trim(Bib.LimpaString(MENumContaD.Text,'.')))<>'') and
         ((Length(Trim(Bib.LimpaString(MENumContaD.Text,'.')))) = vGrau) then
        begin
          vTestaNulo:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Chr(39)+Bib.LimpaString(MENumContaD.Text,'.')+Chr(39)+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
          if vTestaNulo<>''  then
            begin
              If Bib.LimpaString(MENumContaD.Text,'.') <> '' Then
                If DMOracle.BuscaNome('SELECT IND_LIBERADO_USO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Chr(39)+Bib.LimpaString(MENumContaD.Text,'.')+Chr(39)+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano)) = 'NAO' Then
                 Begin
                   MENumContaD.SetFocus;
                   Raise Exception.Create('Conta não liberado para uso');
                 End;
              DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value:=StrToInt(vTestaNulo);
              MECodreduzidoD.Text:=DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Chr(39)+Bib.LimpaString(MENumContaD.Text,'.')+Chr(39)+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
            end;
        end
      else
        begin
          DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Clear;
          MECodreduzidoD.Clear;
        end;
    end;

end;

procedure TFLanctoContabilCad1.BtPlanoContasDClick(Sender: TObject);
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

procedure TFLanctoContabilCad1.BtPlanoContasCClick(Sender: TObject);
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
     DMPlanilha.QLanctoContabilCad1Cod_Plano_Conta.value:=DMPlanoConta.QPlanoContaConsCod_Plano_Conta.Value;
   End;
  DMPlanoConta.QPlanoContaCons.Close;
  FPlanoContaCons.MECodFilial.Clear;
  FPlanoContaCons.MECodFilial.Color:=clWindow;
  FPlanoContaCons.MECodFilial.ReadOnly:=False;

end;

procedure TFLanctoContabilCad1.FormActivate(Sender: TObject);
begin
  inherited;
  With DMPlanoConta do
  Begin
    QPlanoConta.Open;
    Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
       4:
        Begin
          MENumContaD.EditMask := '#.##.##.######;0;';
          MENumContaC.EditMask := '#.##.##.######;0;';
        End;
       5:
        Begin
          MENumContaD.EditMask := '#.##.##.##.######;0;';
          MENumContaD.EditMask := '#.##.##.##.######;0;';
        End;
       6:
        Begin
          MENumContaD.EditMask := '#.##.##.##.##.######;0;';
          MENumContaC.EditMask := '#.##.##.##.##.######;0;';
        End;
    End;
  End;
  DMPlanilha.QLanctoContabilCad.Open;
  DMPlanilha.QLanctoContabilCad1.Open;
//  DMPlanilha.QSomaGrid.Open;
  DSPrimario.AutoEdit:=False;
  DSSecundario.AutoEdit:=False;
  MELocaliza.Visible:=False;

end;

procedure TFLanctoContabilCad1.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DMPlanilha.QLanctoContabilCad1.Insert;
  DMPlanilha.QLanctoContabilCadCOD_PLANILHA.Value:=DMOracle.Sequencia('PLANILHA');
  DMPlanilha.QLanctoContabilCad1COD_PLANILHA.Value:=DMPlanilha.QLanctoContabilCadCOD_PLANILHA.Value;
{  MECodReduzidoC.Text := '';
  MECodReduzidoD.Text := '';
  MeNumContaC.Text := '';
  MeNumContaD.Text := '';   }
  DBEdit1.SetFocus;
end;

procedure TFLanctoContabilCad1.SBAlterarClick(Sender: TObject);
begin
  inherited;
  DMPlanilha.QLanctoContabilCad1.Edit;
end;

procedure TFLanctoContabilCad1.SBConfirmarClick(Sender: TObject);
var
 wLancto,wLancto1:Real;
 wTipoLanc:String;
begin
  {inherited;}
  DmUsuario.Checar_Filial_Usuario( Trim(DMPlanilha.QLanctoContabilCadCOD_FILIAL.Text),'CONTABIL');
  DmUsuario.Checar_Filial_Usuario( Trim(DMPlanilha.QLanctoContabilCad1COD_FILIAL.Text),'CONTABIL');
  If Not DMUsuario.ContabilPrivilegiado Then
     If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Text <> '' Then
        If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Value > StrToDate(DbEdit9.Text) Then
           Raise Exception.Create('Contabilidade Já Fechada Neste Período - Data Lançamento');
  wLancto:=0;
  wLancto:=DMPlanilha.QLanctoContabilCadCod_Lancto_Contabil.Value;
  wLancto1:=DMPlanilha.QLanctoContabilCad1Cod_Lancto_Contabil.Value;
  DMPlanilha.QLanctoContabilCadNum_Contrapartida.Value := MENumContaC.Text;
  DMPlanilha.QLanctoContabilCadCod_Filial_Contrapartida.Value := DMPlanilha.QLanctoContabilCad1Cod_Filial.Value;
  DMPlanilha.QLanctoContabilCad1Num_Contrapartida.Value := MENumContaD.Text;
  DMPlanilha.QLanctoContabilCad1Cod_Filial_Contrapartida.Value := DMPlanilha.QLanctoContabilCadCod_Filial.Value;
  wTipoLanc:='PL';
//  if DMPlanilha.QLanctoContabilCad.State in [DsInsert] then
//  Begin
     DMPlanilha.QLanctoContabilCad.post;
     DMPlanilha.QLanctoContabilCad1.post;
//  End;
  DMPlanilha.QLanctoContabilCad.Close;
  DMPlanilha.QLanctoContabilCad1.Close;
  DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
  DMPlanilha.QLanctoContabilCad.SQL.Add('COD_LANCTO_CONTABIL = '+FloatToStr(wLancto));
  DMPlanilha.QLanctoContabilCad1.SetVariable('COD_LANCTO_CONTABIL',FloatToStr(wLancto1));
  DMPlanilha.QLanctoContabilCad.Open;
  DMPlanilha.QLanctoContabilCad1.Open;
  Try
    DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise exception.Create('Erro! Transação não pode ser concluído.');
  end;
end;

procedure TFLanctoContabilCad1.SBExcluirClick(Sender: TObject);
begin
  If Not DMUsuario.ContabilPrivilegiado Then
     If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Text <> '' Then
        If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Value > DMPlanilha.QLanctoContabilCadDt_Lancamento.Value Then
           Raise Exception.Create('Contabilidade Já Fechada Neste Período - Data Lançamento');
  Inherited;
  DMPlanilha.QLanctoContabilCad1.Delete;
  MECodReduzidoC.Text := '';
  MECodReduzidoD.Text := '';
  MeNumContaC.Text := '';
  MeNumContaD.Text := '';
  DBEdit1.SetFocus;
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;
end;

procedure TFLanctoContabilCad1.SBCancelarClick(Sender: TObject);
begin
//  inherited;
  if MessageDlg('Este Procedimento irá cancelar todos os lançamentos'+#13+'desta planilha.  Confirma ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      Try
        DMOracle.DBCemapa.RollBack;
        DMPlanilha.QLanctoContabilCad.Cancel;
        DMPlanilha.QLanctoContabilCad1.Cancel;
      except
        raise exception.Create('Erro! Transação não pode ser concluído.');
      end;
    end;
  DMPlanilha.QLanctoContabilCad.Close;
  DMPlanilha.QLanctoContabilCad.Open;
  DMPlanilha.QLanctoContabilCad1.Close;
  DMPlanilha.QLanctoContabilCad1.Open;

end;

procedure TFLanctoContabilCad1.MeCodReduzidoCExit(Sender: TObject);
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
         wFilial_Plano := DMPlanilha.QLanctoContabilCad1COD_FILIAL.Value;

      if Trim(MECodReduzidoC.Text)<>'' then
        begin
          vTestaNulo:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzidoC.Text+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
          if vTestaNulo<>'' then
            begin
              If Trim(MECodReduzidoC.Text) <> '' Then
                If DMOracle.BuscaNome('SELECT IND_LIBERADO_USO FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzidoC.Text+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano)) = 'NAO' Then
                 Begin
                   MeCodReduzidoC.SetFocus;
                   Raise Exception.Create('Conta não liberado para uso');
                 End;
              DMPlanilha.QLanctoContabilCad1Cod_Plano_Conta.Value:=StrToInt(vTestaNulo);
              MENumContaC.Text:=DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzidoC.Text+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
            end;
        end
      else
        begin
          DMPlanilha.QLanctoContabilCad1Cod_Plano_Conta.Clear;
          MENumContaC.Clear;
        end;
    end;
end;

procedure TFLanctoContabilCad1.MeNumContaCExit(Sender: TObject);
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
         wFilial_Plano := DMPlanilha.QLanctoContabilCad1COD_FILIAL.Value;

      if ((Trim(Bib.LimpaString(MENumContaC.Text,'.')))<>'') and
         ((Length(Trim(Bib.LimpaString(MENumContaC.Text,'.')))) = vGrau) then
        begin
          vTestaNulo:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Chr(39)+Bib.LimpaString(MENumContaC.Text,'.')+Chr(39)+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
          if vTestaNulo<>''  then
            begin
              If Bib.LimpaString(MENumContaC.Text,'.') <> '' Then
                If DMOracle.BuscaNome('SELECT IND_LIBERADO_USO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Chr(39)+Bib.LimpaString(MENumContaC.Text,'.')+Chr(39)+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano)) = 'NAO' Then
                 Begin
                   MENumContaC.SetFocus;
                   Raise Exception.Create('Conta não liberado para uso');
                 End;
              DMPlanilha.QLanctoContabilCad1Cod_Plano_Conta.Value:=StrToInt(vTestaNulo);
              MECodreduzidoC.Text:=DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Chr(39)+Bib.LimpaString(MENumContaC.Text,'.')+Chr(39)+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
            end;
        end
      else
        begin
          DMPlanilha.QLanctoContabilCad1Cod_Plano_Conta.Clear;
          MECodreduzidoC.Clear;
        end;
    end;
end;

procedure TFLanctoContabilCad1.SBConsultaClick(Sender: TObject);
Var wCod_Lancto_Contabil : Real;
begin
  inherited;
  if FlanctoContabilCons = Nil then
    FlanctoContabilCons := TFlanctoContabilCons.Create(Application);
  if FlanctoContabilCons.ShowModal = mrOk then
  begin
    DMPlanilha.QLanctoContabilCad.Close;
    if not(DMPlanilha.QLanctoContabilConsCod_Planilha.isNull) then
    Begin
      DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
      DMPlanilha.QLanctoContabilCad.SQL.Add('COD_PLANILHA = ' + FloatToStr(DMPlanilha.QLanctoContabilConsCod_Planilha.Value));
    end
    else
      if not(DMPlanilha.QLanctoContabilConsCod_Nota_Cab.isNull) then
      begin
        DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
        DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Nota_Cab.Value) + ' AND COD_NOTA_CAB = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Nota_Cab.Value));
      end
      else
        if not(DMPlanilha.QLanctoContabilConsCod_Contas_Receber_Cab.isNull) then
        begin
          DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
          DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CONTAS_RECEBER_CAB = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contas_receber_cab.Value));
        end
        else
          if not(DMPlanilha.QLanctoContabilConsCod_Conta_Pagar_Cab.isNull) then
          begin
            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CONTA_PAGAR_CAB = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Conta_pagar_cab.Value));
          end
          else
            if not(DMPlanilha.QLanctoContabilConsCod_Bco_Movimento.isNull) then
            begin
              DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
              DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Bco_Movimento.Value)+ ' AND COD_BCO_MOVIMENTO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Bco_Movimento.Value));
            end
            else
              if not(DMPlanilha.QLanctoContabilConsCod_Caixa_Mov.isNull) then
              begin
                DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Caixa_mov.Value)+' AND COD_CAIXA_MOV = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Caixa_mov.Value));
              end
              else
                if not(DMPlanilha.QLanctoContabilConsNum_Rpa.isNull) then
                begin
                  DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                  DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsNum_Rpa.Value)+' AND NUM_RPA = '+FloatToStr(DMPlanilha.QLanctoContabilConsNum_Rpa.Value));
                end
                else
                  if not(DMPlanilha.QLanctoContabilConsCod_Obra.isNull) then
                  begin
                    DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                    DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Obra.Value)+' AND COD_OBRA = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Obra.Value));
                  end
                  else
                    if not(DMPlanilha.QLanctoContabilConsCOD_DEPRECIACAO_PATRIMONIO.IsNull) then
                    begin
                      DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                      DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_DEPRECIACAO_PATRIMONIO.Value)+' AND COD_DEPRECIACAO_PATRIMONIO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_DEPRECIACAO_PATRIMONIO.Value));
                    end
                    else
                      if not(DMPlanilha.QLanctoContabilConsCOD_CONTROLE_CREDITO_ICMS.IsNull) then
                      begin
                        DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                        DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_CONTROLE_CREDITO_ICMS.Value)+' AND COD_CONTROLE_CREDITO_ICMS = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_CONTROLE_CREDITO_ICMS.Value));
                      end
                      else
                        if not(DMPlanilha.QLanctoContabilConsCOD_CONTROLE_CREDITO_ICMS_DIF.IsNull) then
                        begin
                          DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                          DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_CONTROLE_CREDITO_ICMS_DIF.Value)+' AND COD_CONTROLE_CREDITO_ICMS_DIF = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_CONTROLE_CREDITO_ICMS_DIF.Value));
                        end
                        else
                          if not(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_INCORPORACAO.IsNull) then
                          begin
                            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_INCORPORACAO.Value)+' AND COD_PATRIMONIO_INCORPORACAO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_INCORPORACAO.Value));
                          end
                          else
                            if not(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_BAIXA.IsNull) then
                            begin
                              DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                              DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_BAIXA.Value)+' AND COD_PATRIMONIO_BAIXA = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_BAIXA.Value));
                            end
                            else
                              if not(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_BAIXA_DEP_ACUM.IsNull) then
                              begin
                                DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_BAIXA_DEP_ACUM.Value)+' AND COD_PATRIMONIO_BAIXA_DEP_ACUM = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_BAIXA_DEP_ACUM.Value));
                              end
                              else
                                if not(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_ICMS.IsNull) then
                                begin
                                  DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                  DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_ICMS.Value)+' AND COD_PATRIMONIO_ICMS = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PATRIMONIO_ICMS.Value));
                                end
                                else
                                  if not(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_ACC.IsNull) then
                                  begin
                                    DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                    DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_ACC.Value)+' AND COD_OPERACAO_CAMBIO_ACC = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_ACC.Value));
                                  end
                                  else
                                    if not(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_PRT.IsNull) then
                                    begin
                                      DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                      DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_PRT.Value)+' AND COD_OPERACAO_CAMBIO_PRT = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_PRT.Value));
                                    end
                                    else
                                      if not(DMPlanilha.QLanctoContabilConsCOD_EGF.IsNull) then
                                      begin
                                        DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                        DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_EGF.Value)+' AND COD_EGF = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_EGF.Value));
                                      end
                                      else
                                        if not(DMPlanilha.QLanctoContabilConsCOD_EGF_LIQ.IsNull) then
                                        begin
                                          DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                          DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_EGF_LIQ.Value)+' AND COD_EGF_LIQ = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_EGF_LIQ.Value));
                                        end
                                        else
                                          if not(DMPlanilha.QLanctoContabilConsCOD_EGF_LIQ_JURO.IsNull) then
                                          begin
                                            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_EGF_LIQ_JURO.Value)+' AND COD_EGF_LIQ_JURO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_EGF_LIQ_JURO.Value));
                                          end
                                          else
                                            if not(DMPlanilha.QLanctoContabilConsCOD_VARIACAO_CAMBIAL_ACC.IsNull) then
                                            begin
                                              DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                              DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_VARIACAO_CAMBIAL_ACC.Value)+' AND COD_VARIACAO_CAMBIAL_ACC = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_VARIACAO_CAMBIAL_ACC.Value));
                                            end
                                            else
                                              if not(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_SWP.IsNull) then
                                              begin
                                                DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_SWP.Value)+' AND COD_OPERACAO_CAMBIO_SWP = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_SWP.Value));
                                              end
                                              else
                                                if not(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT.IsNull) then
                                                begin
                                                  DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                  DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT.Value)+' AND COD_OPERACAO_CAMBIO_EPT = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT.Value));
                                                end
                                                else
                                                  if not(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ.IsNull) then
                                                  begin
                                                    DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                    DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ.Value)+' AND COD_OPERACAO_CAMBIO_EPT_LIQ = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ.Value));
                                                  end
                                                  else
                                                    if not(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ_J.IsNull) then
                                                    begin
                                                      DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                      DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ_J.Value)+' AND COD_OPERACAO_CAMBIO_EPT_LIQ_J = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ_J.Value));
                                                    end
                                                    else
                                                      if not(DMPlanilha.QLanctoContabilConsCOD_VARIACAO_CAMBIAL_SWP.IsNull) then
                                                      begin
                                                        DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                        DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_VARIACAO_CAMBIAL_SWP.Value)+' AND COD_VARIACAO_CAMBIAL_SWP = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_VARIACAO_CAMBIAL_SWP.Value));
                                                      end
                                                      else
                                                        if not(DMPlanilha.QLanctoContabilConsCOD_VARIACAO_CAMBIAL_EPT.IsNull) then
                                                        begin
                                                          DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                          DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_VARIACAO_CAMBIAL_EPT.Value)+' AND COD_VARIACAO_CAMBIAL_EPT = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_VARIACAO_CAMBIAL_EPT.Value));
                                                        end
                                                        else
                                                          if not(DMPlanilha.QLanctoContabilConsCOD_CAIXA_TRANSF_CAB.IsNull) then
                                                          begin
                                                            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_CAIXA_TRANSF_CAB.Value)+' AND COD_CAIXA_TRANSF_CAB = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_CAIXA_TRANSF_CAB.Value));
                                                          end
                                                        else
                                                          if not(DMPlanilha.QLanctoContabilConsCOD_PREMIO_EXPORTACAO.IsNull) then
                                                          begin
                                                            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PREMIO_EXPORTACAO.Value)+' AND COD_PREMIO_EXPORTACAO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PREMIO_EXPORTACAO.Value));
                                                          end
                                                        else
                                                          if not(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ_S.IsNull) then
                                                          begin
                                                            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ_S.Value)+' AND COD_OPERACAO_CAMBIO_EPT_LIQ_S = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_OPERACAO_CAMBIO_EPT_LIQ_S.Value));
                                                          end
                                                        else
                                                          if not(DMPlanilha.QLanctoContabilConsCOD_APLICACAO_FINANCEIRA_MOV.IsNull) then
                                                          begin
                                                            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_APLICACAO_FINANCEIRA_MOV.Value)+' AND COD_APLICACAO_FINANCEIRA_MOV = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_APLICACAO_FINANCEIRA_MOV.Value));
                                                          end
                                                        else
                                                          if not(DMPlanilha.QLanctoContabilConsCOD_PREMIO_EXPORTACAO.IsNull) then
                                                          begin
                                                            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PREMIO_EXPORTACAO.Value)+' AND COD_PREMIO_EXPORTACAO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_PREMIO_EXPORTACAO.Value));
                                                          end
                                                        else
                                                          if not(DMPlanilha.QLanctoContabilConsCOD_BOLETIM_INDUSTRIA.IsNull) then
                                                          begin
                                                            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                                            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_BOLETIM_INDUSTRIA.Value)+' AND COD_BOLETIM_INDUSTRIA = '+FloatToStr(DMPlanilha.QLanctoContabilConsCOD_BOLETIM_INDUSTRIA.Value));
                                                          end;


    With DMPlanilha do
    Begin
      QLanctoContabilCad.Open;
      QLanctoContabilCad.First;
      wCod_Lancto_Contabil := 0;
      While not QLanctoContabilCad.Eof do
      Begin
        If QLanctoContabilCadIND_OPERACAO.Value <> QLanctoContabilConsIND_OPERACAO.Value Then
          If ((QLanctoContabilCadVAL_LANCAMENTO.Value * -1) = QLanctoContabilConsVAL_LANCAMENTO.Value) And
             (QLanctoContabilCadCOD_HISTORICO_CONTABIL.Value = QLanctoContabilConsCOD_HISTORICO_CONTABIL.Value) Then
            wCod_Lancto_Contabil := QLanctoContabilCadCOD_LANCTO_CONTABIL.Value;
        QLanctoContabilCad.Next;
      End;
      If wCod_Lancto_Contabil = 0 Then
        Raise Exception.Create ('Lançamento Sem Contrapartida');

      QLanctoContabilCad.Close;
      QLanctoContabilCad1.Close;
      QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
      If QLanctoContabilConsInd_Operacao.Value = 'D' Then
      Begin
        QLanctoContabilCad.SQL.Add('COD_LANCTO_CONTABIL = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Lancto_Contabil.Value));
        QLanctoContabilCad1.SetVariable('COD_LANCTO_CONTABIL',wCod_Lancto_Contabil);
      End
      Else
      Begin
        QLanctoContabilCad.SQL.Add('COD_LANCTO_CONTABIL = '+FloatToStr(wCod_Lancto_Contabil));
        QLanctoContabilCad1.SetVariable('COD_LANCTO_CONTABIL',DMPlanilha.QLanctoContabilConsCod_Lancto_Contabil.Value);
      End;
      QLanctoContabilCad.Open;
      QLanctoContabilCad1.Open;
    End;
  end;
end;

procedure TFLanctoContabilCad1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPlanoConta.QPlanoConta.Open;
  DMPlanilha.QLanctoContabilCad.Close;
  DMPlanilha.QLanctoContabilCad1.Close;
  Action := CaFree;
  FLanctoContabilCad1 := Nil;
end;

procedure TFLanctoContabilCad1.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  MENumContaD.Text:=DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+FloatToStr(DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value));
  MECodReduzidoD.Text:=DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+FloatToStr(DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value));

end;

procedure TFLanctoContabilCad1.DsSecundarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  MENumContaC.Text:=DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+FloatToStr(DMPlanilha.QLanctoContabilCad1Cod_Plano_Conta.Value));
  MECodReduzidoc.Text:=DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+FloatToStr(DMPlanilha.QLanctoContabilCad1Cod_Plano_Conta.Value));

end;

procedure TFLanctoContabilCad1.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if (DSPrimario.State in [DsInsert,DsEdit]) or
     (DMOracle.DBCemapa.InTransaction) then
    begin
      BtHistContabil.Enabled:=True;
      SbCodFilialC.Enabled:=True;
      BtPlanoContasC.Enabled:=True;
      SbCodFilialD.Enabled:=True;
      BtPlanoContasD.Enabled:=True;
    end
  else
    begin
      BtHistContabil.Enabled:=False;
      SbCodFilialC.Enabled:=False;
      BtPlanoContasC.Enabled:=False;
      SbCodFilialD.Enabled:=False;
      BtPlanoContasD.Enabled:=False;
    end;

end;

procedure TFLanctoContabilCad1.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  DMPlanilha.QLanctoContabilCad1COD_FILIAL.Value := DMPlanilha.QLanctoContabilCadCOD_FILIAL.Value;
end;

procedure TFLanctoContabilCad1.BtHistContabilClick(Sender: TObject);
begin
  inherited;
  if FHistContabilCons = Nil then
    FHistContabilCons := TFHistContabilCons.Create(Application);
  if FHistContabilCons.Showmodal = mrOK then
    begin
      with DMPlanilha do
        QLanctoContabilCadCod_Historico_contabil.Value:=DMHistContabil.QHistContabilConsCod_historico_COntabil.Value;
    end;

end;

procedure TFLanctoContabilCad1.SbCodFilialCClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.Showmodal = mrOK then
    begin
      with DMPlanilha do
        QLanctoContabilCad1Cod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
    end;

end;

procedure TFLanctoContabilCad1.SBCodFilialDClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.Showmodal = mrOK then
    begin
      with DMPlanilha do
        QLanctoContabilCadCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
    end;

end;

procedure TFLanctoContabilCad1.RazaoAnaltico1Click(Sender: TObject);
begin
  inherited;
  FLanctoContabilCad.RazoAnaltico1Click(Self);
end;

procedure TFLanctoContabilCad1.BalanceteAnaltico1Click(Sender: TObject);
begin
  inherited;
  FLanctoContabilCad.BalanceteAnaltico1Click(Self);
end;

procedure TFLanctoContabilCad1.DirioGeral1Click(Sender: TObject);
begin
  inherited;
  FLanctoContabilCad.DirioGeral1Click(Self);
end;

procedure TFLanctoContabilCad1.BalanoPatrimonial1Click(Sender: TObject);
begin
  inherited;
  FLanctoContabilCad.BalanoPatrimonial1Click(Self);
end;

procedure TFLanctoContabilCad1.RelatrioMovPConferncia1Click(
  Sender: TObject);
begin
  inherited;
  FLanctoContabilCad.RelatrioMovPConferncia1Click(Self);
end;

procedure TFLanctoContabilCad1.ViradaMs1Click(Sender: TObject);
begin
  inherited;
  FLanctoContabilCad.ViradadeMs1Click(Self);
end;

procedure TFLanctoContabilCad1.ZeramentoExerccio1Click(Sender: TObject);
begin
  inherited;
  FLanctoContabilCad.ZeramentodeExerccio1Click(Self);
end;

procedure TFLanctoContabilCad1.VoltaZeramentoExercicio1Click(
  Sender: TObject);
begin
  inherited;
  FLanctoContabilCad.VoltaZeramentodeExerccio1Click(Self);
end;

procedure TFLanctoContabilCad1.AtualizaSaldoMensal1Click(Sender: TObject);
begin
  inherited;
  FLanctoContabilCad.AtualizaSaldoMensal1Click(Self);
end;

procedure TFLanctoContabilCad1.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(6);
end;

procedure TFLanctoContabilCad1.ResumoAnual1Click(Sender: TObject);
begin
  inherited;
  FLanctoContabilCad.ResumoAnual1Click(Self);
end;

procedure TFLanctoContabilCad1.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  If Trim(DbEdit3.Text) <> '' Then
    If DMOracle.BuscaNome('SELECT IND_LIBERADO_USO FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+Trim(DbEdit3.Text)) = 'NAO' Then
     Begin
       DBEdit3.SetFocus;
       Raise Exception.Create('Conta não liberado para uso');
     End;

end;

procedure TFLanctoContabilCad1.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  If Trim(DbEdit11.Text) <> '' Then
    If DMOracle.BuscaNome('SELECT IND_LIBERADO_USO FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+Trim(DbEdit11.Text)) = 'NAO' Then
     Begin
       DbEdit11.SetFocus;
       Raise Exception.Create('Conta não liberado para uso');
     End;

end;

end.
