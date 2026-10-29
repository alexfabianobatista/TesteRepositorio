unit ULanctoContabilCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, ToolWin, OleCtnrs, DBDirceu, variants,
  ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFLanctoContabilCad = class(TFTCadSimples)
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
    DBEFilial: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    BtFilial: TBitBtn;
    BtPlanoContas: TBitBtn;
    DBRGOperacao: TDBRadioGroup;
    DBGLanc: TDBGrid;
    BtHistContabil: TBitBtn;
    DBEdit14: TDBEdit;
    Label11: TLabel;
    Label14: TLabel;
    DBEdit15: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    BtAlteracao: TBitBtn;
    BtExclusao: TBitBtn;
    BtInclusao: TBitBtn;
    MECodReduzido: TMaskEdit;
    Label19: TLabel;
    MENumConta: TMaskEdit;
    Label18: TLabel;
    RazoAnaltico1: TMenuItem;
    Opes1: TMenuItem;
    ViradadeMs1: TMenuItem;
    BalanceteAnaltico1: TMenuItem;
    ZeramentodeExerccio1: TMenuItem;
    VoltaZeramentodeExerccio1: TMenuItem;
    DirioGeral1: TMenuItem;
    BalanoPatrimonial1: TMenuItem;
    RelatrioMovPConferncia1: TMenuItem;
    AtualizaSaldoMensal1: TMenuItem;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    ResumoAnual1: TMenuItem;
    SaldoContabil1: TMenuItem;
    AtualizaSaldodeEncerramento1: TMenuItem;
    Atualizacontabilidadegrasel1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure BtPlanoContasClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure BtHistContabilClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtDeletaClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure BtInclusaoClick(Sender: TObject);
    procedure BtAlteracaoClick(Sender: TObject);
    procedure BtExclusaoClick(Sender: TObject);
    procedure MECodReduzidoExit(Sender: TObject);
    procedure MENumContaExit(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure RazoAnaltico1Click(Sender: TObject);
    procedure ViradadeMs1Click(Sender: TObject);
    procedure BalanceteAnaltico1Click(Sender: TObject);
    procedure ZeramentodeExerccio1Click(Sender: TObject);
    procedure VoltaZeramentodeExerccio1Click(Sender: TObject);
    procedure DirioGeral1Click(Sender: TObject);
    procedure BalanoPatrimonial1Click(Sender: TObject);
    procedure RelatrioMovPConferncia1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure DBGLancCellClick(Column: TColumn);
    procedure AtualizaSaldoMensal1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ResumoAnual1Click(Sender: TObject);
    procedure SaldoContabil1Click(Sender: TObject);
    procedure AtualizaSaldodeEncerramento1Click(Sender: TObject);
    procedure Atualizacontabilidadegrasel1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure FazSoma(Tipo,Codigo:String);
  public
    { Public declarations }
  end;

  Reg_Plano = Record
    wCod_Plano_Plano     : Integer;
    wValor               : Real;
  end;

var
  FLanctoContabilCad: TFLanctoContabilCad;

implementation

uses UPlanilha_cl, UOracle_cl, UHistContabilCons, UHistContabil_cl,
  UFilialCons, UFilial_cl, UPlanoContaCons, UPlanoConta_cl,
  ULanctoContabilCons, UParamSistema_cl, UBiblioteca, UContabilParam,
  URContabil_RazaoAnalitico, UViradaMes, UAguarde,
  URContabil_Balancete_Analit_Mes, URContabil_Balancete_Analit_Acum,
  UZeraExercicio, URContabil_Diario, URBalancoPatrimonial,
  URContabilMovConf, UAtualizaSaldo, URContabil_Diario1, UUsuario_cl,
  URResumoAnual, URelContabil_cl, URSaldoContabil, URNotaExplicativa,DelRun,
  StrUtils;

{$R *.DFM}

procedure TFLanctoContabilCad.FormActivate(Sender: TObject);
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
  DSPrimario.AutoEdit:=False;
  MELocaliza.Visible:=False;
end;

procedure TFLanctoContabilCad.BtPlanoContasClick(Sender: TObject);
begin
  inherited;
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  FPlanoContaCons.MECodFilial.Text:=FloatToStr(DMPlanilha.QLanctoContabilCadCod_Filial.Value);
  FPlanoContaCons.MECodFilial.ParentColor:=True;
  FPlanoContaCons.MECodFilial.ReadOnly:=True;
  if FPlanoContaCons.ShowModal = MrOk then
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

procedure TFLanctoContabilCad.SBIncluirClick(Sender: TObject);
begin
  DMPlanilha.QLanctoContabilCad.Close;
  DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
  DMPlanilha.QLanctoContabilCad.SQL.Add('COD_LANCTO_CONTABIL = 0');
  DMPlanilha.QLanctoContabilCad.Open;
  DMPlanilha.QLanctoContabilCad.Insert;
  DMPlanilha.QLanctoContabilCadCOD_PLANILHA.Value:=DMOracle.Sequencia('PLANILHA');
  DMPlanilha.QSomaGrid.Close;
  FazSoma('PLANILHA',FloatToStr(DMPlanilha.QLanctoContabilCadCOD_PLANILHA.Value));
  DMPlanilha.QSomaGrid.Open;
  FLanctoContabilCad.DBEdit13.ReadOnly :=  False;
  FLanctoContabilCad.DBEFilial.ReadOnly :=  False;
  FLanctoContabilCad.DBEdit8.ReadOnly :=  False;
  FLanctoContabilCad.MECodReduzido.ReadOnly :=  False;
  FLanctoContabilCad.MENumConta.ReadOnly :=  False;
  FLanctoContabilCad.DBRGOperacao.ReadOnly :=  False;
  FLanctoContabilCad.DBEdit12.ReadOnly :=  False;
  FLanctoContabilCad.DBEdit10.ReadOnly :=  False;
  FlanctoContabilCad.BtInclusao.Enabled:=True;
end;

procedure TFLanctoContabilCad.SBConfirmarClick(Sender: TObject);
var
 wLancto:Real;
 wTipoLanc:String;
begin
  {inherited;}
  DmUsuario.Checar_Filial_Usuario( Trim(DMPlanilha.QLanctoContabilCadCOD_FILIAL.Text),'CONTABIL');
  If Not DMUsuario.ContabilPrivilegiado Then
     If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Text <> '' Then
       If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Value > StrToDate(DbEdit10.Text) Then
          Raise Exception.Create('Contabilidade Já Fechada Neste Período - Data Lançamento');
  wLancto:=0;
  if not(DMPlanilha.QLanctoContabilCadCod_Planilha.isNull) then
    begin
      wLancto:=DMPlanilha.QLanctoContabilCadCod_Planilha.Value;
      wTipoLanc:='PL';
    end
  else
    if not(DMPlanilha.QLanctoContabilCadCod_Nota_Cab.isNull) then
      begin
        wLancto:=DMPlanilha.QLanctoContabilCadCod_Nota_Cab.Value;
        wTipoLanc:='NF';
      end
    else
      if not(DMPlanilha.QLanctoContabilCadCod_Contas_Receber_Cab.isNull) then
        begin
          wLancto:=DMPlanilha.QLanctoContabilCadCod_Contas_Receber_Cab.Value;
          wTipoLanc:='CR';
        end
      else
        if not(DMPlanilha.QLanctoContabilCadCod_Conta_Pagar_Cab.isNull) then
          begin
            wLancto:=DMPlanilha.QLanctoContabilCadCod_Conta_Pagar_Cab.Value;
            wTipoLanc:='CP';
          end
        else
          if not(DMPlanilha.QLanctoContabilCadCod_Bco_Movimento.isNull) then
            begin
              wLancto:=DMPlanilha.QLanctoContabilCadCod_Bco_Movimento.Value;
              wTipoLanc:='BC';
            end
          else
            if not(DMPlanilha.QLanctoContabilCadCod_Caixa_Mov.isNull) then
              begin
                wLancto:=DMPlanilha.QLanctoContabilCadCod_Caixa_Mov.Value;
                wTipoLanc:='CX';
              end;
  if DMPlanilha.QLanctoContabilCad.State in [DsInsert] then
     DMPlanilha.QLanctoContabilCad.post;
  DMPlanilha.QLanctoContabilCad.Close;
  // incluido
  if wTipoLanc ='PL' then
    begin
      DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
      DMPlanilha.QLanctoContabilCad.SQL.Add('COD_PLANILHA = '+FloatToStr(wLancto));
    end
  else
    if wTipoLanc ='NF' then
      begin
        DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
        DMPlanilha.QLanctoContabilCad.SQL.Add('COD_NOTA_CAB = '+FloatToStr(wLancto));
      end
    else
      if wTipoLanc ='CR' then
        begin
          DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
          DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CONTAS_RECEBER_CAB = '+FloatToStr(wLancto));
        end
      else
        if wTipoLanc ='CP' then
          begin
            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CONTA_PAGAR_CAB = '+FloatToStr(wLancto));
          end
        else
          if wTipoLanc ='BC' then
            begin
              DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
              DMPlanilha.QLanctoContabilCad.SQL.Add('COD_BCO_MOVIMENTO = '+FloatToStr(wLancto));
            end
          else
            if wTipoLanc ='CX' then
              begin
                DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CAIXA_MOV = '+FloatToStr(wLancto));
              end;
  //  fim
  DMPlanilha.QLanctoContabilCad.Open;
  DMPlanilha.QSomaGrid.Close;
  DMPlanilha.QSomaGrid.Open;
  if DMPlanilha.QSomaGridSaldo.value<>0 then
    begin
      ShowMessage('Esta Planilha não pode ser gravada pois o Saldo não fechou');
      DMPlanilha.QLanctoContabilCad.edit;
    end
  else
    begin
      Try
        DMOracle.DBCemapa.Commit;
        DBGLanc.Enabled:=True;
        except
          DMOracle.DBCemapa.Rollback;
          raise exception.Create('Erro! Transação não pode ser concluído.');
      end;
      if wTipoLanc ='PL' then
        begin
          DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
          DMPlanilha.QLanctoContabilCad.SQL.Add('COD_PLANILHA = '+FloatToStr(wLancto));
        end
      else
        if wTipoLanc ='NF' then
          begin
            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_NOTA_CAB = '+FloatToStr(wLancto));
          end
        else
          if wTipoLanc ='CR' then
            begin
              DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
              DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CONTAS_RECEBER_CAB = '+FloatToStr(wLancto));
            end
          else
            if wTipoLanc ='CP' then
              begin
                DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CONTA_PAGAR_CAB = '+FloatToStr(wLancto));
              end
            else
              if wTipoLanc ='BC' then
                begin
                  DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                  DMPlanilha.QLanctoContabilCad.SQL.Add('COD_BCO_MOVIMENTO = '+FloatToStr(wLancto));
                end
              else
                if wTipoLanc ='CX' then
                  begin
                    DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                    DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CAIXA_MOV = '+FloatToStr(wLancto));
                  end;
      DMPlanilha.QLanctoContabilCad.Open;
    end;
end;

procedure TFLanctoContabilCad.BtHistContabilClick(Sender: TObject);
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

procedure TFLanctoContabilCad.BtFilialClick(Sender: TObject);
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

procedure TFLanctoContabilCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if (DSPrimario.State in [DsInsert,DsEdit]) or
     (DMOracle.DBCemapa.InTransaction) then
    begin
      BtHistContabil.Enabled:=True;
      BtFilial.Enabled:=True;
      BtPlanoContas.Enabled:=True;
      SBIncluir.Enabled := False;
      SBAlterar.Enabled := False;
      SBExcluir.Enabled := False;
      SBConfirmar.Enabled := True;
      SBCancelar.Enabled := True;
      SBRefresh.Enabled := False;
      MELocaliza.Enabled := False;
      SBConsulta.Enabled := False;
      MECodReduzido.ReadOnly:=False;
      MENumConta.ReadOnly:=False;
    end
  else
    begin
      BtFilial.Enabled:=False;
      BtHistContabil.Enabled:=False;
      BtPlanoContas.Enabled:=False;
      BtInclusao.Enabled:=False;
      BtAlteracao.Enabled:=False;
      BtExclusao.Enabled:=False;
      MECodReduzido.ReadOnly:=True;
      MENumConta.ReadOnly:=True;
    end;
end;

procedure TFLanctoContabilCad.SBCancelarClick(Sender: TObject);
begin
{  inherited;}
  if MessageDlg('Este Procedimento irá cancelar todos os lançamentos'+#13+'desta planilha.  Confirma ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      Try
        DMOracle.DBCemapa.RollBack;
        DMPlanilha.QLanctoContabilCad.Cancel;
        DBGLanc.Enabled:=True;
      except
        raise exception.Create('Erro! Transação não pode ser concluído.');
      end;
    end;
  DMPlanilha.QLanctoContabilCad.Close;
  DMPlanilha.QLanctoContabilCad.Open;
end;

procedure TFLanctoContabilCad.SBConsultaClick(Sender: TObject);
Var
  wCod_Lancto_Contabil : Real; //ADICIONADO SERGIO 17/05/2003
begin
  inherited;
  if FlanctoContabilCons=Nil then
    FlanctoContabilCons:=TFlanctoContabilCons.Create(Application);
  if FlanctoContabilCons.ShowModal = mrOk then
    begin
      DMPlanilha.QLanctoContabilCad.Close;
      if not(DMPlanilha.QLanctoContabilConsCod_Planilha.isNull) then
        Begin
          DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
          DMPlanilha.QLanctoContabilCad.SQL.Add('COD_PLANILHA = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Planilha.Value));
          DMPlanilha.QSomaGrid.Close;
          FazSoma('PLANILHA',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Planilha.Value));
          DMPlanilha.QSomaGrid.Open;
        end
      else
        if not(DMPlanilha.QLanctoContabilConsCod_Nota_Cab.isNull) then
          begin
            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Nota_Cab.Value)+' AND COD_NOTA_CAB='+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Nota_Cab.Value));
            DMPlanilha.QSomaGrid.Close;
            FazSoma('NOTA',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Nota_Cab.Value));
            DMPlanilha.QSomaGrid.Open;
          end
        else
          if not(DMPlanilha.QLanctoContabilConsCod_Contas_Receber_Cab.isNull) then
            begin
              DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
              DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CONTAS_RECEBER_CAB = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contas_receber_cab.Value));
              DMPlanilha.QSomaGrid.Close;
              FazSoma('CONTAS_RECEBER',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contas_Receber_cab.Value));
              DMPlanilha.QSomaGrid.Open;
            end
          else
            if not(DMPlanilha.QLanctoContabilConsCod_Conta_Pagar_Cab.isNull) then
              begin
                DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CONTA_PAGAR_CAB = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Conta_pagar_cab.Value));
                DMPlanilha.QSomaGrid.Close;
                FazSoma('CONTAS_PAGAR',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Conta_Pagar_cab.Value));
                DMPlanilha.QSomaGrid.Open;
              end
            else
              if not(DMPlanilha.QLanctoContabilConsCod_Bco_Movimento.isNull) then
                begin
                  DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                  DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Bco_Movimento.Value)+ ' AND COD_BCO_MOVIMENTO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Bco_Movimento.Value));
                  DMPlanilha.QSomaGrid.Close;
                  FazSoma('BANCO',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Bco_Movimento.Value));
                  DMPlanilha.QSomaGrid.Open;
                end
              else
                if not(DMPlanilha.QLanctoContabilConsCod_Caixa_Mov.isNull) then
                  begin
                    DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                    DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Caixa_mov.Value)+' AND COD_CAIXA_MOV = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Caixa_mov.Value));
                    DMPlanilha.QSomaGrid.Close;
                    FazSoma('CAIXA',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Caixa_Mov.Value));
                    DMPlanilha.QSomaGrid.Open;
                  end
                else
                  if not(DMPlanilha.QLanctoContabilConsNum_Rpa.isNull) then
                    begin
                      DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                      DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsNum_Rpa.Value)+' AND NUM_RPA = '+FloatToStr(DMPlanilha.QLanctoContabilConsNum_Rpa.Value));
                      DMPlanilha.QSomaGrid.Close;
                      FazSoma('RPA',FloatToStr(DMPlanilha.QLanctoContabilConsNum_Rpa.Value));
                      DMPlanilha.QSomaGrid.Open;
                    end
                  else
                    if not(DMPlanilha.QLanctoContabilConsCod_Conhecimento_Frete.isNull) then
                      begin
                        DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                        DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Conhecimento_Frete.Value)+
                                               ' AND COD_CONHECIMENTO_FRETE = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Conhecimento_Frete.Value));
                        DMPlanilha.QSomaGrid.Close;
                        FazSoma('CNH',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Conhecimento_Frete.Value));
                        DMPlanilha.QSomaGrid.Open;
                      end
                    else
                      if not(DMPlanilha.QLanctoContabilConsCod_Estadia.isNull) then
                       begin
                        DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                        DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Estadia.Value)+
                                               ' AND COD_ESTADIA = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Estadia.Value));
                        DMPlanilha.QSomaGrid.Close;
                        FazSoma('EST',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Estadia.Value));
                        DMPlanilha.QSomaGrid.Open;
                       end
                      Else
                        if not(DMPlanilha.QLanctoContabilConsCod_Obra.isNull) then
                        begin
                          DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                          DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Obra.Value)+
                                                 ' AND COD_OBRA = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Obra.Value));
                          DMPlanilha.QSomaGrid.Close;
                          FazSoma('OBRA',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Obra.Value));
                          DMPlanilha.QSomaGrid.Open;
                        end
                        Else
                          if not(DMPlanilha.QLanctoContabilConsCod_Caixa_Transf_Cab.isNull) then
                          begin
                            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Caixa_Transf_Cab.Value)+
                                                   ' AND COD_CAIXA_TRANSF_CAB = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Caixa_Transf_Cab.Value));
                            DMPlanilha.QSomaGrid.Close;
                            FazSoma('CAIXA_TRANSF',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Caixa_Transf_Cab.Value));
                            DMPlanilha.QSomaGrid.Open;
                          end
                          Else
                            if not(DMPlanilha.QLanctoContabilConsCod_Contrato.isNull) then
                            begin
                              DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                              DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato.Value)+
                                                     ' AND COD_CONTRATO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato.Value));
                              DMPlanilha.QSomaGrid.Close;
                              FazSoma('CCFUTURA',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato.Value));
                              DMPlanilha.QSomaGrid.Open;
                            end
                            Else
                              if not(DMPlanilha.QLanctoContabilConsCod_Contrato_Gp.isNull) then
                              begin
                                DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato_Gp.Value)+
                                                       ' AND COD_CONTRATO_GP = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato_Gp.Value));
                                DMPlanilha.QSomaGrid.Close;
                                FazSoma('CGPRECO',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato_gP.Value));
                                DMPlanilha.QSomaGrid.Open;
                              end
                              Else
                                if not(DMPlanilha.QLanctoContabilConsCod_Contrato_Vend.isNull) then
                                begin
                                  DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                  DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato_Vend.Value)+
                                                         ' AND COD_CONTRATO_VEND = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato_Vend.Value));
                                  DMPlanilha.QSomaGrid.Close;
                                  FazSoma('CVENDA',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato_Vend.Value));
                                  DMPlanilha.QSomaGrid.Open;
                                end
                                Else
                                  if not(DMPlanilha.QLanctoContabilConsCod_Contrato_Arroz.isNull) then
                                  begin
                                    DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                    DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato_Arroz.Value)+
                                                           ' AND COD_CONTRATO_ARROZ = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato_Arroz.Value));
                                    DMPlanilha.QSomaGrid.Close;
                                    FazSoma('ARROZ',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Contrato_Arroz.Value));
                                    DMPlanilha.QSomaGrid.Open;
                                  end
                                   Else
                                    if not(DMPlanilha.QLanctoContabilConsCod_Boletim_Industria.isNull) then
                                    begin
                                      DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                                      DMPlanilha.QLanctoContabilCad.SQL.Add('COD_GENERICO = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Boletim_Industria.Value)+
                                                             ' AND COD_BOLETIM_INDUSTRIA = '+FloatToStr(DMPlanilha.QLanctoContabilConsCod_Boletim_Industria.Value));
                                      DMPlanilha.QSomaGrid.Close;
                                      FazSoma('IND',FloatToStr(DMPlanilha.QLanctoContabilConsCod_Boletim_Industria.Value));
                                      DMPlanilha.QSomaGrid.Open;
                                    end;
      DMPlanilha.QLanctoContabilCad.Open;

{//***************************************
//     ADICIONADO SERGIO 17/05/2003
//***************************************
      With DMPlanilha do
      Begin
        QLanctoContabilCad.First;
        wCod_Lancto_Contabil := 0;
        While not QLanctoContabilCad.Eof do
        Begin
          If QLanctoContabilCadInd_Operacao.Value <> QLanctoContabilConsInd_Operacao.Value Then
              If ((QLanctoContabilCadVal_Lancamento.Value * -1) = QLanctoContabilConsVal_Lancamento.Value) And
                 (QLanctoContabilCadCod_Historico_Contabil.Value = QLanctoContabilConsCod_Historico_Contabil.Value) Then
                 wCod_Lancto_Contabil := QLanctoContabilCadCod_Lancto_Contabil.Value;
          QLanctoContabilCad.Next;
        End;
//        If wCod_Lancto_Contabil = 0 Then
//           Raise Exception.Create ('Lançamento Sem Contrapartida');

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
      End;  }
    end;
end;

procedure TFLanctoContabilCad.BtDeletaClick(Sender: TObject);
var
  wPlanilha:Integer;
begin
  inherited;
  wPlanilha:=DMPlanilha.QLanctoContabilCadCOD_PLANILHA.Value;
  DMPlanilha.QLanctoContabilCad.Delete;
{  if (DMPlanilha.QLanctoGrid.RecordCount)-1=0 then}
    begin
      DMPlanilha.QLanctoContabilCad.Edit;
      DMPlanilha.QLanctoContabilCadCOD_PLANILHA.Value:=wPlanilha;
    end;
  DMPlanilha.QSomaGrid.Close;
  DMPlanilha.QSomaGrid.Open;
end;

procedure TFLanctoContabilCad.SBExcluirClick(Sender: TObject);
begin
{  inherited;}
  If Not DMUsuario.ContabilPrivilegiado Then
     If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Text <> '' Then
        If DMParamSistema.QParamSistemaDT_FECHAMENTO_CONTABIL.Value > DMPlanilha.QLanctoContabilCadDt_Lancamento.Value Then
           Raise Exception.Create('Contabilidade Já Fechada Neste Período - Data Lançamento');
  if MessageDLg('Atenção este procedimento irá excluir TODOS os lançamentos desta planilha.'+#13+'Confirma esta Operação ?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      DMPlanilha.QLanctoContabilCad.First;
      while not(DMPlanilha.QLanctoContabilCad.EOF) do
        begin
          DMPlanilha.QLanctoContabilCad.Delete;
        end;
    end;
  If DMOracle.DBCemapa.InTransaction Then
     DMOracle.DbCemapa.Commit;
end;

procedure TFLanctoContabilCad.BtInclusaoClick(Sender: TObject);
var
  wLancto:Integer;
  wtipoLanc:String;
begin
  inherited;
  wLancto:=0;
  if DMPlanilha.QLanctoContabilCad.State in [dsEdit,dsInsert] Then
    DMPlanilha.QLanctoContabilCad.Post;
  if not(DMPlanilha.QLanctoContabilCadCod_Planilha.isNull) then
    begin
      wLancto:=DMPlanilha.QLanctoContabilCadCod_Planilha.Value;
      wTipoLanc:='PL';
    end
  else
    if not(DMPlanilha.QLanctoContabilCadCod_Nota_Cab.isNull) then
      begin
        wLancto:=DMPlanilha.QLanctoContabilCadCod_Nota_Cab.Value;
        wTipoLanc:='NF';
      end
    else
      if not(DMPlanilha.QLanctoContabilCadCod_Contas_Receber_Cab.isNull) then
        begin
          wLancto:=DMPlanilha.QLanctoContabilCadCod_Contas_Receber_Cab.Value;
          wTipoLanc:='CR';
        end
      else
        if not(DMPlanilha.QLanctoContabilCadCod_Conta_Pagar_Cab.isNull) then
          begin
            wLancto:=DMPlanilha.QLanctoContabilCadCod_Conta_Pagar_Cab.Value;
            wTipoLanc:='CP';
          end
        else
          if not(DMPlanilha.QLanctoContabilCadCod_Bco_Movimento.isNull) then
            begin
              wLancto:=DMPlanilha.QLanctoContabilCadCod_Bco_Movimento.Value;
              wTipoLanc:='BC';
            end
          else
            if not(DMPlanilha.QLanctoContabilCadCod_Caixa_Mov.isNull) then
              begin
                wLancto:=DMPlanilha.QLanctoContabilCadCod_Caixa_Mov.Value;
                wTipoLanc:='CX';
              end;

    DMPlanilha.QLanctoContabilCad.Close;

    if wTipoLanc ='PL' then
      begin
        DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
        DMPlanilha.QLanctoContabilCad.SQL.Add('COD_PLANILHA = '+FloatToStr(wLancto));
      end
    else
      if wTipoLanc ='NF' then
        begin
          DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
          DMPlanilha.QLanctoContabilCad.SQL.Add('COD_NOTA_CAB = '+FloatToStr(wLancto));
        end
      else
        if wTipoLanc ='CR' then
          begin
            DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
            DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CONTAS_RECEBER_CAB = '+FloatToStr(wLancto));
          end
        else
          if wTipoLanc ='CP' then
            begin
              DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
              DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CONTA_PAGAR_CAB = '+FloatToStr(wLancto));
            end
          else
            if wTipoLanc ='BC' then
              begin
                DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                DMPlanilha.QLanctoContabilCad.SQL.Add('COD_BCO_MOVIMENTO = '+FloatToStr(wLancto));
              end
            else
              if wTipoLanc ='CX' then
                begin
                  DMPlanilha.QLanctoContabilCad.SQL[DMPlanilha.QLanctoContabilCad.SQL.Count-1]:='';
                  DMPlanilha.QLanctoContabilCad.SQL.Add('COD_CAIXA_MOV = '+FloatToStr(wLancto));
                end;
   DMPlanilha.QLanctoContabilCad.Open;
   DMPlanilha.QLanctoContabilCad.Insert;

    if wTipoLanc ='PL' then
      DMPlanilha.QLanctoContabilCadCod_Planilha.Value:=wLancto
    else
      if wTipoLanc ='NF' then
        DMPlanilha.QLanctoContabilCadCod_Nota_Cab.Value:=wLancto
      else
        if wTipoLanc ='CR' then
          DMPlanilha.QLanctoContabilCadCod_Contas_Receber_Cab.Value:=wLancto
        else
          if wTipoLanc ='CP' then
            DMPlanilha.QLanctoContabilCadCod_Conta_Pagar_Cab.Value:=wLancto
          else
            if wTipoLanc ='BC' then
              DMPlanilha.QLanctoContabilCadCod_Bco_Movimento.Value:=wLancto
            else
              if wTipoLanc ='CX' then
                DMPlanilha.QLanctoContabilCadCod_Caixa_Mov.Value:=wLancto;

   DMPlanilha.QSomaGrid.Close;
   DMPlanilha.QSomaGrid.Open;
   DBEFilial.SetFocus;
   BtAlteracao.Enabled:=False;
   FLanctoContabilCad.DBEdit13.ReadOnly :=  False;
   FLanctoContabilCad.DBEFilial.ReadOnly :=  False;
   FLanctoContabilCad.DBEdit8.ReadOnly :=  False;
   FLanctoContabilCad.MECodReduzido.ReadOnly :=  False;
   FLanctoContabilCad.MENumConta.ReadOnly :=  False;
   FLanctoContabilCad.DBRGOperacao.ReadOnly :=  False;
   FLanctoContabilCad.DBEdit12.ReadOnly :=  False;
   FLanctoContabilCad.DBEdit10.ReadOnly :=  False;
end;

procedure TFLanctoContabilCad.BtAlteracaoClick(Sender: TObject);
begin
  inherited;
  BtInclusao.Enabled:=True;
  BtAlteracao.Enabled:=False;
  BtExclusao.Enabled:=False;
  DMPlanilha.QLanctoContabilCad.Edit;
  DMPlanilha.QLanctoContabilCadNum_Contrapartida.Value := '';
//  if DMPlanilha.QLanctoContabilCadInd_Atualiza_Saldo.Value = 'SIM' Then
//    DMPlanilha.AtzSaldoContabil(DMPlanilha.QLanctoContabilCadInd_Operacao.Value,DMPlanilha.QLanctoContabilCadCod_Filial.Value,DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value,-DMPlanilha.QLanctoContabilCadVal_Lancamento.Value,DMPlanilha.QLanctoContabilCadDt_Lancamento.Value);
  DMPlanilha.QSomaGrid.Close;
  DMPlanilha.QSomaGrid.Open;
  FLanctoContabilCad.DBEdit13.ReadOnly :=  False;
  FLanctoContabilCad.DBEFilial.ReadOnly :=  False;
  FLanctoContabilCad.DBEdit8.ReadOnly :=  False;
  FLanctoContabilCad.MECodReduzido.ReadOnly :=  False;
  FLanctoContabilCad.MENumConta.ReadOnly :=  False;
  FLanctoContabilCad.DBRGOperacao.ReadOnly :=  False;
  FLanctoContabilCad.DBEdit12.ReadOnly :=  False;
  FLanctoContabilCad.DBEdit10.ReadOnly :=  False;
end;

procedure TFLanctoContabilCad.BtExclusaoClick(Sender: TObject);
begin
  inherited;
  DMPlanilha.QLanctoContabilCad.Delete;
  SBIncluir.Enabled := False;
  SBAlterar.Enabled := False;
  SBExcluir.Enabled := False;
  SBConfirmar.Enabled := True;
  SBCancelar.Enabled := True;
  SBRefresh.Enabled := False;
  SBConsulta.Enabled := False;
  DMPlanilha.QSomaGrid.Close;
  DMPlanilha.QSomaGrid.Open;
  FLanctoContabilCad.DBEdit13.ReadOnly :=  False;
  FLanctoContabilCad.DBEFilial.ReadOnly :=  False;
  FLanctoContabilCad.DBEdit8.ReadOnly :=  False;
  FLanctoContabilCad.MECodReduzido.ReadOnly :=  False;
  FLanctoContabilCad.MENumConta.ReadOnly :=  False;
  FLanctoContabilCad.DBRGOperacao.ReadOnly :=  False;
  FLanctoContabilCad.DBEdit12.ReadOnly :=  False;
  FLanctoContabilCad.DBEdit10.ReadOnly :=  False;
end;

procedure TFLanctoContabilCad.MECodReduzidoExit(Sender: TObject);
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

      if Trim(MECodReduzido.Text) <> '' then
        begin
          vTestaNulo:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzido.Text+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano));
          if vTestaNulo <> '' then
            begin
              DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value:=StrToInt(vTestaNulo);
              If DMOracle.BuscaNome('SELECT IND_LIBERADO_USO FROM TB_PLANO_CONTA','COD_REDUZIDO = '+MECodReduzido.Text+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano)) = 'NAO' Then
               Begin
                 MeCodReduzido.SetFocus;
                 Raise Exception.Create('Conta não liberado para uso');
               End;
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

procedure TFLanctoContabilCad.MENumContaExit(Sender: TObject);
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
              DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value:=StrToInt(vTestaNulo);
              If DMOracle.BuscaNome('SELECT IND_LIBERADO_USO FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Chr(39)+Bib.LimpaString(MENumConta.Text,'.')+Chr(39)+' AND COD_FILIAL = '+FloatToStr(wFilial_Plano)) = 'NAO' Then
               Begin
                 MENumConta.SetFocus;
                 Raise Exception.Create('Conta não liberado para uso');
               End;
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

procedure TFLanctoContabilCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  MENumConta.Text:=DMOracle.BuscaNome('SELECT NUM_PLANO_CONTA FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+FloatToStr(DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value));
  MECodReduzido.Text:=DMOracle.BuscaNome('SELECT COD_REDUZIDO FROM TB_PLANO_CONTA','COD_PLANO_CONTA = '+FloatToStr(DMPlanilha.QLanctoContabilCadCod_Plano_Conta.Value));
end;

procedure TFLanctoContabilCad.RazoAnaltico1Click(Sender: TObject);
var
   vPeriodoInicial,vPeriodoFinal,vDataInicial,vDataFinal : String;
begin
  inherited;
  if FContabilParam = Nil then
    FContabilParam:=TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[0].TabVisible:=True;
  if FContabilParam.ShowModal=mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContabilParam.ME0CodFilial.Text),'CONTABIL');
      with DMPlanilha do
        begin
          QRRazaoAnalitico.Close;
          if Trim(FContabilParam.ME0CodFilial.Text) <> '' then
           Begin
            QRRazaoAnalitico.SetVariable('FILIAL_INICIAL',StrToInt(Trim(FContabilParam.ME0CodFilial.Text)));
            PFilial_Inicial:=StrToInt(FContabilParam.ME0CodFilial.Text);
           End
          else
            Raise Exception.Create('Informar Filial Inicial' );
          if Trim(FContabilParam.ME0CodFilial1.Text) <> '' then
           Begin
            QRRazaoAnalitico.SetVariable('FILIAL_FINAL',StrToInt(Trim(FContabilParam.ME0CodFilial1.Text)));
            PFilial_Final:=StrToInt(FContabilParam.ME0CodFilial1.Text);
           End
          else
            Raise Exception.Create('Informar Filial Final' );
          if Trim(Bib.LimpaString(FContabilParam.ME0PeriodoInicial.Text,'/')) <> '' then
            begin
              QRRazaoAnalitico.SetVariable('PERIODO_INICIAL',StrToInt(Trim(Bib.LimpaString(FContabilParam.ME0PeriodoInicial.Text,'/'))));
              vPeriodoInicial:=FContabilParam.ME0PeriodoInicial.Text;
            end
          else
            begin
              QRRazaoAnalitico.SetVariable('PERIODO_INICIAL',Null);
              vPeriodoInicial:='____/__';
            end;

          if Trim(Bib.LimpaString(FContabilParam.ME0PeriodoFinal.Text,'/')) <> '' then
            begin
              QRRazaoAnalitico.SetVariable('PERIODO_FINAL',StrToInt(Trim(Bib.LimpaString(FContabilParam.ME0PeriodoFinal.Text,'/'))));
              vPeriodoFinal:=FContabilParam.ME0PeriodoFinal.Text;
            end
          else
            begin
              QRRazaoAnalitico.SetVariable('PERIODO_FINAL',Null);
              vPeriodoFinal:='____/__';
            end;

          if Trim(FContabilParam.ME0DtInicial.Text) <> '' then
            begin
              QRRazaoAnalitico.SetVariable('DT_INICIAL',StrToDate(FContabilParam.ME0DtInicial.Text));
              PDataFinal:=StrToDate(FContabilParam.ME0DtInicial.Text);
              vDataInicial:=FContabilParam.ME0DtInicial.Text;
            end
          else
            begin
              QRRazaoAnalitico.SetVariable('DT_INICIAL',Null);
              vDataInicial:='__/__/____'
            end;

          if Trim(FContabilParam.ME0DtFinal.Text) <> '' then
            begin
              QRRazaoAnalitico.SetVariable('DT_FINAL',StrToDate(FContabilParam.ME0DtFinal.Text));
              vDataFinal:=FContabilParam.ME0DtFinal.Text;
            end
          else
            begin
              QRRazaoAnalitico.SetVariable('DT_FINAL',Null);
              vDataFinal:='__/__/____';
            end;

          if Trim(FContabilParam.ME0ContaInicial.Text) <> '' then
            QRRazaoAnalitico.SetVariable('CONTA_INICIAL',Trim(FContabilParam.ME0ContaInicial.Text))
          else
            QRRazaoAnalitico.SetVariable('CONTA_INICIAL',Null);

          if Trim(FContabilParam.ME0ContaFinal.Text) <> '' then
            QRRazaoAnalitico.SetVariable('CONTA_FINAL',Trim(FContabilParam.ME0ContaFinal.Text))
          else
            QRRazaoAnalitico.SetVariable('CONTA_FINAL',Null);
          QRRazaoAnalitico.Open;
          If FRContabil_RazaoAnalitico= Nil then
            FRContabil_RazaoAnalitico:=TFRContabil_RazaoAnalitico.Create(Application);

          FRContabil_RazaoAnalitico.Pag_Inicial:=StrToInt(Trim(FContabilParam.Me0Pagina.Text)) - 1;

          FRContabil_RazaoAnalitico.QRLPeriodo.Caption:='PERIODO INICIAL: '+vPeriodoInicial+' FINAL: '+vPeriodoFinal;
          FRContabil_RazaoAnalitico.QRLData.Caption:='Filial:'+FContabilParam.ME0Filial.Text;
          FRContabil_RazaoAnalitico.QRLDataPeriodo.Caption := 'DATA INICIAL: '+vDataInicial+' FINAL: '+vDataFinal;

          FRContabil_RazaoAnalitico.QRLabel3.Font.Color:=clwhite;
          FRContabil_RazaoAnalitico.QRLabel5.Font.Color:=clwhite;
          FRContabil_RazaoAnalitico.QRDBText3.Font.Color:=clwhite;
          FRContabil_RazaoAnalitico.QRDBText1.Font.Color:=clwhite;
          FRContabil_RazaoAnalitico.QRDBText2.Font.Color:=clwhite;
          FRContabil_RazaoAnalitico.QRBand6.Height := 19;
          
          If FContabilParam.RGPreview.ItemIndex=0 then
            FRContabil_RazaoAnalitico.QRPrimario.Preview
          else
            FRContabil_RazaoAnalitico.QRPrimario.Print;
          QRRazaoAnalitico.Close;
          FRContabil_RazaoAnalitico.Destroy;
          FRContabil_RazaoAnalitico:=Nil;
        end;
    end;
    DMPlanilha.PFilial_Inicial:=0;
    DMPlanilha.PFilial_Final:=0;
end;

procedure TFLanctoContabilCad.ViradadeMs1Click(Sender: TObject);
var
  vComp,wMes,wAno :Integer;
  wDataInicial,wDataFinal,wNum_Conta : String;
  wAnoMes: Integer;
begin
  inherited;
  if FViradaMes = Nil then
    FViradaMes := TFViradaMes.Create(Application);
  wAnoMes := 0;
  TryStrToInt(String(Sender),wAnoMes);
  if wAnoMes > 0 then
  begin
    FViradaMes.MEAnoMes.Text := copy(IntToStr(wAnoMes),0,4)+'/'+
      copy(IntToStr(wAnoMes),5,2);
    DmUsuario.Checar_Filial_Usuario( Trim(FViradaMes.MECodFilial.Text),'CONTABIL');
    DMOracle.DBCemapa.StartTransaction;
    Try
      with DMPlanilha do
       begin
          vComp:=StrToInt(Copy(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'),5,2));
          if vComp = 1 then
            vComp := 89
          else
            vComp := 1;
          QViradaMes.Close;
          QViradaMes.Sql.Clear;
          QViradaMes.Sql.Add('SELECT COD_FILIAL,COD_PLANO_CONTA,DT_ANO_MES,VAL_ANTERIOR,VAL_ATUAL,VAL_CREDITO,VAL_DEBITO ');
          QViradaMes.Sql.Add('FROM TB_SALDO_CONTABIL WHERE ');
          QViradaMes.Sql.Add('DT_ANO_MES = ' + IntToStr(StrToInt(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'))-vComp));
          If Trim(FViradaMes.MECodFilial.Text) <> '' then
             QViradaMes.Sql.Add(' AND COD_FILIAL = ' + FViradaMes.MECodFilial.Text);
          QViradaMes.Sql.Add(' and COD_PLANO_CONTA >= 0 ');
          QViradaMes.Open;
          // esta rotina irá zerar as contas já existentes com saldo antes da virada(no periodo)
          QZeraVirada.Close;
          QZeraVirada.Sql.Clear;
          QZeraVirada.Sql.Add(' UPDATE  TB_SALDO_CONTABIL SET VAL_ANTERIOR = 0,VAL_ATUAL = 0,VAL_CREDITO = 0, VAL_DEBITO  = 0');
          QZeraVirada.Sql.Add(' WHERE ');
          QZeraVirada.Sql.Add(' DT_ANO_MES = '+Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'));
          If Trim(FViradaMes.MECodFilial.Text) <> '' then
             QZeraVirada.Sql.Add(' AND COD_FILIAL = ' + FViradaMes.MECodFilial.Text);
          QZeraVirada.Sql.Add(' AND COD_PLANO_CONTA >= 0');
          QZeraVirada.ExecSQL;

          wMes:=StrToInt(Copy(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'),5,2));
          wAno:=StrToInt(Copy(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'),1,4));
          wDataInicial:=('01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno));
          wDataFinal:=(FormatFloat('00',DMOracle.DiasNoMes(StrToDate(wDataInicial)))+'/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno));
          QViradaMes.First;
          while not(QViradaMes.Eof) do
          begin
            QSaldoContabil.Close;
            QSaldoContabil.SetVariable('COD_CONTA',QViradaMesCod_Plano_Conta.Value);
            QSaldoContabil.SetVariable('FILIAL',QViradaMesCod_Filial.Value);
            QSaldoContabil.SetVariable('ANO_MES',StrToInt(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/')));
            QSaldoContabil.Open;
            If QSaldoContabil.Eof Then
               QSaldoContabil.Insert
            Else
               QSaldoContabil.Edit;
            QSaldoContabilDt_Ano_Mes.Value:=StrToInt(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'));
            QSaldoContabilCod_Plano_Conta.Value:=QViradaMesCod_Plano_Conta.Value;
            QSaldoContabilCod_Filial.Value:=QViradaMesCod_Filial.Value;
            QSaldoContabilVal_Anterior.Value:=QViradaMesVal_Atual.Value;
            QSaldoContabilVal_Credito.Value:=0;
            QSaldoContabilVal_Debito.Value:=0;
            QSaldoContabilVal_Atual.Value:=QViradaMesVal_Atual.Value;
            QSaldoContabil.Post;
            QViradaMes.Next;
          End;
          QSaldoContabil.Close;
          QViradaMes.Close;
       end;  // with
    Except
     DMOracle.DBCemapa.RollBack;
     Raise;
    End;
    Exit;
  end;

  if FViradaMes.ShowModal = MrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FViradaMes.MECodFilial.Text),'CONTABIL');
      DMOracle.DBCemapa.StartTransaction;
      Try
        with DMPlanilha do
         begin
            vComp:=StrToInt(Copy(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'),5,2));
            if vComp = 1 then
              vComp := 89
            else
              vComp := 1;
            QViradaMes.Close;
            QViradaMes.Sql.Clear;
            QViradaMes.Sql.Add('SELECT COD_FILIAL,COD_PLANO_CONTA,DT_ANO_MES,VAL_ANTERIOR,VAL_ATUAL,VAL_CREDITO,VAL_DEBITO ');
            QViradaMes.Sql.Add('FROM TB_SALDO_CONTABIL WHERE ');
            QViradaMes.Sql.Add('DT_ANO_MES = ' + IntToStr(StrToInt(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'))-vComp));
            If Trim(FViradaMes.MECodFilial.Text) <> '' then
               QViradaMes.Sql.Add(' AND COD_FILIAL = ' + FViradaMes.MECodFilial.Text);
            QViradaMes.Sql.Add(' and COD_PLANO_CONTA >= 0 ');
            QViradaMes.Open;
            // esta rotina irá zerar as contas já existentes com saldo antes da virada(no periodo)
            QZeraVirada.Close;
            QZeraVirada.Sql.Clear;
            QZeraVirada.Sql.Add(' UPDATE  TB_SALDO_CONTABIL SET VAL_ANTERIOR = 0,VAL_ATUAL = 0,VAL_CREDITO = 0, VAL_DEBITO  = 0');
            QZeraVirada.Sql.Add(' WHERE ');
            QZeraVirada.Sql.Add(' DT_ANO_MES = '+Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'));
            If Trim(FViradaMes.MECodFilial.Text) <> '' then
               QZeraVirada.Sql.Add(' AND COD_FILIAL = ' + FViradaMes.MECodFilial.Text);
            QZeraVirada.Sql.Add(' AND COD_PLANO_CONTA >= 0');
            QZeraVirada.ExecSQL;

            wMes:=StrToInt(Copy(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'),5,2));
            wAno:=StrToInt(Copy(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'),1,4));
            wDataInicial:=('01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno));
            wDataFinal:=(FormatFloat('00',DMOracle.DiasNoMes(StrToDate(wDataInicial)))+'/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno));
            QViradaMes.First;
            while not(QViradaMes.Eof) do
            begin
              QSaldoContabil.Close;
              QSaldoContabil.SetVariable('COD_CONTA',QViradaMesCod_Plano_Conta.Value);
              QSaldoContabil.SetVariable('FILIAL',QViradaMesCod_Filial.Value);
              QSaldoContabil.SetVariable('ANO_MES',StrToInt(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/')));
              QSaldoContabil.Open;
              If QSaldoContabil.Eof Then
                 QSaldoContabil.Insert
              Else
                 QSaldoContabil.Edit;
              QSaldoContabilDt_Ano_Mes.Value:=StrToInt(Bib.LimpaString(FViradaMes.MEAnoMes.Text,'/'));
              QSaldoContabilCod_Plano_Conta.Value:=QViradaMesCod_Plano_Conta.Value;
              QSaldoContabilCod_Filial.Value:=QViradaMesCod_Filial.Value;
              QSaldoContabilVal_Anterior.Value:=QViradaMesVal_Atual.Value;
              QSaldoContabilVal_Credito.Value:=0;
              QSaldoContabilVal_Debito.Value:=0;
              QSaldoContabilVal_Atual.Value:=QViradaMesVal_Atual.Value;
              QSaldoContabil.Post;
              QViradaMes.Next;
            End;
            QSaldoContabil.Close;
            QViradaMes.Close;
         end;  // with
      Except
       DMOracle.DBCemapa.RollBack;
       Raise;
      End;
      DMOracle.DBCemapa.Commit;
      ShowMessage('Saldos para Virada de Mês gerados com Sucesso!');
    end;
    FViradaMes.Destroy;
    FViradaMes:=Nil;
end;

procedure TFLanctoContabilCad.BalanceteAnaltico1Click(Sender: TObject);
var
  vPeriodo:String;
begin
  inherited;
  if FContabilParam = Nil then
    FContabilParam:=TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[1].TabVisible:=True;
  if FContabilParam.ShowModal=mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContabilParam.ME1CodFilial.Text),'CONTABIL');
      with DMPlanilha do
        begin
          if FContabilParam.RG1Tipo.ItemIndex=0 then
            begin
              QRBalanceteAnalitico.Close;
              QRSomaContas.Close;
              if Trim(FContabilParam.ME1CodFilial.Text) <> '' then
                QRBalanceteAnalitico.SetVariable('COD_FILIAL',StrToInt(Trim(FContabilParam.ME1CodFilial.Text)))
              else
                Raise Exception.Create('Informar a Filial');

              if Trim(FContabilParam.ME1CodFilialFinal.Text) <> '' then
                QRBalanceteAnalitico.SetVariable('COD_FILIAL_FINAL',StrToInt(Trim(FContabilParam.ME1CodFilialFinal.Text)))
              else
                Raise Exception.Create('Informar a Filial');

              if Trim(Bib.LimpaString(FContabilParam.ME1PeriodoInicial.Text,'/')) <> '' then
                QRBalanceteAnalitico.SetVariable('DT_ANO_MES',StrToInt(Trim(Bib.LimpaString(FContabilParam.ME1PeriodoInicial.Text,'/'))))
              else
                QRBalanceteAnalitico.SetVariable('DT_ANO_MES',Null);

              if Trim(FContabilParam.ME1ContaInicial.Text) <> '' then
                QRBalanceteAnalitico.SetVariable('CONTA_INICIAL',Trim(FContabilParam.ME1ContaInicial.Text))
              else
                QRBalanceteAnalitico.SetVariable('CONTA_INICIAL',Null);

              if Trim(FContabilParam.ME1ContaFinal.Text) <> '' then
                QRBalanceteAnalitico.SetVariable('CONTA_FINAL',Trim(FContabilParam.ME1ContaFinal.Text))
              else
                QRBalanceteAnalitico.SetVariable('CONTA_FINAL',Null);

              if FContabilParam.RG1UltimoGrau.ItemIndex=0 then
                QRBalanceteAnalitico.SetVariable('NUM_GRAU',DMParamSistema.QParamSistemaNum_Graus_Contabil.Value)
              else
                QRBalanceteAnalitico.SetVariable('NUM_GRAU',DMParamSistema.QParamSistemaNum_Graus_Contabil.Value-1);

              if Trim(FContabilParam.ME1CodFilial.Text) <> '' then
                QRSomaContas.SetVariable('COD_FILIAL',StrToInt(Trim(FContabilParam.ME1CodFilial.Text)));

              if Trim(FContabilParam.ME1CodFilialFinal.Text) <> '' then
                QRSomaContas.SetVariable('COD_FILIAL_FINAL',StrToInt(Trim(FContabilParam.ME1CodFilialFinal.Text)));

              if Trim(Bib.LimpaString(FContabilParam.ME1PeriodoInicial.Text,'/')) <> '' then
                QRSomaContas.SetVariable('DT_ANO_MES',StrToInt(Trim(Bib.LimpaString(FContabilParam.ME1PeriodoInicial.Text,'/'))))
              else
                QRSomaContas.SetVariable('DT_ANO_MES',Null);

              if Trim(FContabilParam.ME1ContaInicial.Text) <> '' then
                QRSomaContas.SetVariable('CONTA_INICIAL',Trim(FContabilParam.ME1ContaInicial.Text))
              else
                QRSomaContas.SetVariable('CONTA_INICIAL',Null);

              if Trim(FContabilParam.ME1ContaFinal.Text) <> '' then
                QRSomaContas.SetVariable('CONTA_FINAL',Trim(FContabilParam.ME1ContaFinal.Text))
              else
                QRSomaContas.SetVariable('CONTA_FINAL',Null);

              QRSomaContas.SetVariable('NUM_GRAU',DMParamSistema.QParamSistemaNum_Graus_Contabil.Value);

              QRBalanceteAnalitico.Open;
              QRSomaContas.Open;

              If  FRContabil_Balancete_Analit_Mes = Nil then
                FRContabil_Balancete_Analit_Mes:=TFRContabil_Balancete_Analit_Mes.Create(Application);

              FRContabil_Balancete_Analit_Mes.Pag_Inicial:=StrToInt(Trim(FContabilParam.ME1Pagina.Text))-1;

              FRContabil_Balancete_Analit_Mes.QRLFilial.Caption:='Filial:' + FContabilParam.ME1Filial.Text;
              FRContabil_Balancete_Analit_Mes.QRLPeriodo.Caption:=FContabilParam.ME1PeriodoInicial.Text + ' Ate ' + FContabilParam.ME1PeriodoFinal.Text;
              FRContabil_Balancete_Analit_Mes.QRLTitular.Caption:= FContabilParam.METitular.Text;
              FRContabil_Balancete_Analit_Mes.QRLFuncaoCRC.Caption:= FContabilParam.MEFuncao.Text + '  CRC - ' + FContabilParam.MECRC.Text;
              FRContabil_Balancete_Analit_Mes.QRLContador.Caption:= FContabilParam.MEContador.Text;

              FRContabil_Balancete_Analit_Mes.QRLabel6.Enabled := (FContabilParam.Rg1SaldoAnterior.ItemIndex = 0);
              FRContabil_Balancete_Analit_Mes.QRDBText4.Enabled := (FContabilParam.Rg1SaldoAnterior.ItemIndex = 0);

              If FContabilParam.RGPreview.ItemIndex=0 then
                FRContabil_Balancete_Analit_Mes.QRPrimario.Preview
              else
                FRContabil_Balancete_Analit_Mes.QRPrimario.Print;
              QRBalanceteAnalitico.Close;
              QRSomaContas.Close;
              FRContabil_Balancete_Analit_Mes.Destroy;
              FRContabil_Balancete_Analit_Mes:=Nil;
            end

          else
            begin
              QRBalanceteAnaliticoAcum.Close;
              QRSomaContasAcum.Close;
              if Trim(FContabilParam.ME1CodFilial.Text) <> '' then
                QRBalanceteAnaliticoAcum.SetVariable('COD_FILIAL',StrToInt(Trim(FContabilParam.ME1CodFilial.Text)))
              else
                Raise Exception.Create('Informar Filial Inicial' );

              if Trim(FContabilParam.ME1CodFilialFinal.Text) <> '' then
                QRBalanceteAnaliticoAcum.SetVariable('COD_FILIAL_FINAL',StrToInt(Trim(FContabilParam.ME1CodFilialFinal.Text)))
              else
                Raise Exception.Create('Informar Filial Final' );

              if Trim(Bib.LimpaString(FContabilParam.ME1PeriodoFinal.Text,'/')) <> '' then
                QRBalanceteAnaliticoAcum.SetVariable('PERIODO_FINAL',StrToInt(Trim(Bib.LimpaString(FContabilParam.ME1PeriodoFinal.Text,'/'))))
              else
                QRBalanceteAnaliticoAcum.SetVariable('PERIODO_FINAL',Null);

              if Trim(Bib.LimpaString(FContabilParam.ME1PeriodoInicial.Text,'/')) <> '' then
                QRBalanceteAnaliticoAcum.SetVariable('PERIODO_INICIAL',StrToInt(Trim(Bib.LimpaString(FContabilParam.ME1PeriodoInicial.Text,'/'))))
              else
                QRBalanceteAnaliticoAcum.SetVariable('PERIODO_INICIAL',Null);

              if Trim(FContabilParam.ME1ContaInicial.Text) <> '' then
                QRBalanceteAnaliticoAcum.SetVariable('CONTA_INICIAL',Trim(FContabilParam.ME1ContaInicial.Text))
              else
                QRBalanceteAnaliticoAcum.SetVariable('CONTA_INICIAL',Null);

              if Trim(FContabilParam.ME1ContaFinal.Text) <> '' then
                QRBalanceteAnaliticoAcum.SetVariable('CONTA_FINAL',Trim(FContabilParam.ME1ContaFinal.Text))
              else
                QRBalanceteAnaliticoAcum.SetVariable('CONTA_FINAL',Null);

              if FContabilParam.RG1UltimoGrau.ItemIndex=0 then
                QRBalanceteAnaliticoAcum.SetVariable('NUM_GRAU',DMParamSistema.QParamSistemaNum_Graus_Contabil.Value)
              else
                QRBalanceteAnaliticoAcum.SetVariable('NUM_GRAU',DMParamSistema.QParamSistemaNum_Graus_Contabil.Value-1);


              if Trim(FContabilParam.ME1CodFilial.Text) <> '' then
                QRSomaContasAcum.SetVariable('COD_FILIAL',StrToInt(Trim(FContabilParam.ME1CodFilial.Text)))
              else
                QRSomaContasAcum.SetVariable('COD_FILIAL',Null);

              if Trim(FContabilParam.ME1CodFilialFinal.Text) <> '' then
                QRSomaContasAcum.SetVariable('COD_FILIAL_FINAL',StrToInt(Trim(FContabilParam.ME1CodFilialFinal.Text)))
              else
                QRSomaContasAcum.SetVariable('COD_FILIAL_FINAL',Null);

              if Trim(Bib.LimpaString(FContabilParam.ME1PeriodoInicial.Text,'/')) <> '' then
                QRSomaContasAcum.SetVariable('DT_ANO_MES_INICIAL',StrToInt(Trim(Bib.LimpaString(FContabilParam.ME1PeriodoInicial.Text,'/'))))
              else
                QRSomaContasAcum.SetVariable('DT_ANO_MES_INICIAL',Null);

              if Trim(Bib.LimpaString(FContabilParam.ME1PeriodoFinal.Text,'/')) <> '' then
                QRSomaContasAcum.SetVariable('DT_ANO_MES_FINAL',StrToInt(Trim(Bib.LimpaString(FContabilParam.ME1PeriodoFinal.Text,'/'))))
              else
                QRSomaContasAcum.SetVariable('DT_ANO_MES_FINAL',Null);

              if Trim(FContabilParam.ME1ContaInicial.Text) <> '' then
                QRSomaContasAcum.SetVariable('CONTA_INICIAL',Trim(FContabilParam.ME1ContaInicial.Text))
              else
                QRSomaContasAcum.SetVariable('CONTA_INICIAL',Null);

              if Trim(FContabilParam.ME1ContaFinal.Text) <> '' then
                QRSomaContasAcum.SetVariable('CONTA_FINAL',Trim(FContabilParam.ME1ContaFinal.Text))
              else
                QRSomaContasAcum.SetVariable('CONTA_FINAL',Null);

              QRSomaContasAcum.SetVariable('NUM_GRAU',DMParamSistema.QParamSistemaNum_Graus_Contabil.Value);

              QRBalanceteAnaliticoAcum.Open;
              QRSomaContasAcum.Open;

              if  FRContabil_Balancete_Analit_Mes = Nil then
                  FRContabil_Balancete_Analit_Mes:=TFRContabil_Balancete_Analit_Mes.Create(Application);
              if  FRContabil_Balancete_Analit_Acum = Nil then
                FRContabil_Balancete_Analit_Acum:=TFRContabil_Balancete_Analit_Acum.Create(Application);

              FRContabil_Balancete_Analit_Acum.Pag_Inicial:=StrToInt(Trim(FContabilParam.ME1Pagina.Text))-1;

              FRContabil_Balancete_Analit_Acum.QRLPeriodo.Caption:=FContabilParam.ME1PeriodoInicial.Text + ' Ate ' + FContabilParam.ME1PeriodoFinal.Text;
              FRContabil_Balancete_Analit_Acum.QRLFilial.Caption:='Filial:' + FContabilParam.ME1Filial.Text;
              FRContabil_Balancete_Analit_Acum.QRLTitular.Caption:= FContabilParam.METitular.Text;
              FRContabil_Balancete_Analit_Acum.QRLFuncaoCRC.Caption:= FContabilParam.MEFuncao.Text + '  CRC - ' + FContabilParam.MECRC.Text;
              FRContabil_Balancete_Analit_Acum.QRLContador.Caption:= FContabilParam.MEContador.Text;

              FRContabil_Balancete_Analit_Acum.QRLabel6.Enabled := (FContabilParam.Rg1SaldoAnterior.ItemIndex = 0);
              FRContabil_Balancete_Analit_Acum.QRDBText4.Enabled := (FContabilParam.Rg1SaldoAnterior.ItemIndex = 0);

              If FContabilParam.RGPreview.ItemIndex=0 then
                FRContabil_Balancete_Analit_Acum.QRPrimario.Preview
              else
                FRContabil_Balancete_Analit_Acum.QRPrimario.Print;
              QRBalanceteAnaliticoAcum.Close;
              QRSomaContasAcum.Close;
              FRContabil_Balancete_Analit_Acum.free;
              FRContabil_Balancete_Analit_Acum:=Nil;
            end;
        end;
    end;
end;

procedure TFLanctoContabilCad.ZeramentodeExerccio1Click(Sender: TObject);
Var wHistorico, wPlanilha, wCod_Plano_Conta : Integer;
begin
  inherited;
  if FZeraExercicio = Nil then
    FZeraExercicio := TFZeraExercicio.Create(Application);
  if FZeraExercicio.ShowModal = MrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FZeraExercicio.MECodFilial.Text),'CONTABIL');
      With DMPlanilha do
        begin
          Try
            DMOracle.DBCemapa.StartTransaction;
            QZeraExercicio.Close;
            If Trim(FZeraExercicio.MECodFilial.Text) = '' then
               Raise Exception.Create ('Obrigatório Informar Código da Filial');
            QZeraExercicio.SetVariable('COD_FILIAL',FZeraExercicio.MECodFilial.Text);

            if Trim(FZeraExercicio.MEPeriodo.Text)<>'' then
              QZeraExercicio.SetVariable('DT_ANO_MES',StrToInt(Bib.LimpaString(FZeraExercicio.MEPeriodo.Text,'/')))
            else
              QZeraExercicio.SetVariable('DT_ANO_MES',Null);

            QZeraExercicio.SetVariable('NUM_GRAU',DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value);
            QZeraExercicio.Open;
            QLanctoCont.Open;

            QSomaZeraExercicio.Close;
            if Trim(FZeraExercicio.MECodFilial.Text)<>'' then
              QSomaZeraExercicio.SetVariable('COD_FILIAL1',FZeraExercicio.MECodFilial.Text)
            else
              QSomaZeraExercicio.SetVariable('COD_FILIAL1',Null);
            if Trim(FZeraExercicio.MEPeriodo.Text)<>'' then
              QSomaZeraExercicio.SetVariable('DT_ANO_MES',StrToInt(Trim(Bib.LimpaString(FZeraExercicio.MEPeriodo.Text,'/'))))
            else
              QSomaZeraExercicio.SetVariable('DT_ANO_MES',Null);
            QSomaZeraExercicio.SetVariable('NUM_GRAU',DMParamSistema.QParamSistemaNUM_GRAUS_CONTABIL.Value);
            QSomaZeraExercicio.Open;

            QZeraExercicio.First;

            // Conta Contra-partida
            wPlanilha := DMOracle.Sequencia('PLANILHA');
            wHistorico := DMParamSistema.QParamSistemaCOD_HISTORICO_CONTABIL_ZERA_EX.Value;
            wCod_Plano_Conta := StrToInt(DMoracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+FZeraExercicio.MENumConta.Text));
            QLanctoCont.Insert;
            QLanctoContCod_Planilha.Value := wPlanilha;
            QLanctoContCod_Lancto_Contabil.Value:=DMOracle.Sequencia('LANCTO_CONTABIL');
            QLanctoContCod_Filial.Value:=QZeraExercicioCOD_FILIAL.Value;
            QLanctoContCod_Historico_Contabil.Value:= wHistorico;
            QLanctoContCod_Plano_Conta.Value:= wCod_Plano_Conta;
            QLanctoContDt_Lancamento.Value:=StrToDate(FZeraExercicio.MeDtLancamento.Text);
            QLanctoContDesc_Complemento.Value:='Lançamento de Zeramento de Exercício (Contra Partida)';
            QLanctoContVal_Lancamento.Value:=QSomaZeraExercicioSoma_Credito.Value;
            QLanctoContInd_operacao.Value:='C';
            QLanctoCont.Post;

            QLanctoCont.Insert;
            QLanctoContCod_Planilha.Value := wPlanilha;
            QLanctoContCod_Lancto_Contabil.Value:=DMOracle.Sequencia('LANCTO_CONTABIL');
            QLanctoContCod_Filial.Value:=QZeraExercicioCOD_FILIAL.Value;
            QLanctoContCod_Historico_Contabil.Value:= wHistorico;
            QLanctoContCod_Plano_Conta.Value:= wCod_Plano_Conta;
            QLanctoContDt_Lancamento.Value:=StrToDate(FZeraExercicio.MeDtLancamento.Text);
            QLanctoContDesc_Complemento.Value:='Lançamento de Zeramento de Exercício (Contra Partida)';
            QLanctoContVal_Lancamento.Value:=QSomaZeraExercicioSoma_Debito.Value;
            QLanctoContInd_operacao.Value:='D';
            QLanctoCont.Post;
            while not QZeraExercicio.EOF do
              begin
                QLanctoCont.Insert;
                QLanctoContCod_Planilha.Value:=wPlanilha;
                QLanctoContCod_Lancto_Contabil.Value:=DMOracle.Sequencia('LANCTO_CONTABIL');
                QLanctoContCod_Filial.Value:=QZeraExercicioCOD_FILIAL.Value;
                QLanctoContCod_Historico_Contabil.Value:=wHistorico;
                QLanctoContCod_Plano_Conta.Value:=QZeraExercicioCod_Plano_Conta.Value;
                QLanctoContDt_Lancamento.Value:=StrToDate(FZeraExercicio.MeDtLancamento.Text);
                QLanctoContDesc_Complemento.Value:='Lançamento de Zeramento de Exercício';
                QLanctoContVal_Lancamento.Value:=QZeraExercicioVal_Atual.Value * (-1);
                if (QZeraExercicioVal_Atual.Value)<0 then
                  begin
                    QLanctoContInd_operacao.Value:='D';
//                    DMPlanilha.ZeraExSaldoContabil('D',StrToFloat(FZeraExercicio.MECodFilial.Text),QZeraExercicioCod_Plano_Conta.Value,
//                                                  -QZeraExercicioVal_Atual.Value,
//                                                  DMOracle.DataServ);
                  end
                else
                  begin
                    QLanctoContInd_operacao.Value:='C';
//                    DMPlanilha.ZeraExSaldoContabil('C',StrToFloat(FZeraExercicio.MECodFilial.Text),QZeraExercicioCod_Plano_Conta.Value,
//                                                  -QZeraExercicioVal_Atual.Value,
//                                                  DMOracle.DataServ);
                  end;
                QLanctoCont.Post;
                QZeraExercicio.Next;
              end;

              DMOracle.DBCemapa.Commit;
          except
            If QLanctoCont.State in [DsInsert,DsEdit] Then
               QLanctoCont.Cancel;
            DMOracle.DBCemapa.Rollback;
            Raise;
            ShowMessage('Erro! Na Geração de Lançamentos de Zeramento de Exercício.'+#13+'');
          end;
          QLanctoCont.Close;
          QZeraExercicio.Close;
          QSomaZeraExercicio.Close;
        end;
    end;
    FZeraExercicio.Destroy;
    FZeraExercicio:=Nil;
end;

procedure TFLanctoContabilCad.VoltaZeramentodeExerccio1Click(
  Sender: TObject);
Begin
  inherited;
  if FZeraExercicio = Nil then
    FZeraExercicio := TFZeraExercicio.Create(Application);
  FZeraExercicio.Panel1.Visible := False;
  FZeraExercicio.Label3.Visible := False;
  FZeraExercicio.MeNumConta.Visible := False;
  FZeraExercicio.BitBtn2.Visible := False;
  FZeraExercicio.MeDescConta.Visible := False;
  if FZeraExercicio.ShowModal = MrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FZeraExercicio.MECodFilial.Text),'CONTABIL');
      Try
        DMoracle.DBCemapa.StartTransaction;
        with DMPlanilha do
          begin
            QVoltaZera.Close;
            if Trim(FZeraExercicio.MECodFilial.Text) <> '' then
              QVoltaZera.SetVariable('COD_FILIAL',StrToInt(Trim(FZeraExercicio.MECodFilial.Text)))
            Else
              Raise Exception.Create('Informar a Filial');
            If Trim(FZeraExercicio.MeDtLancamento.Text) = '' Then
              Raise Exception.Create('Informar a Data');
            QVoltaZera.SetVariable('DT_INICIAL',StrToDate(FZeraExercicio.MeDtLancamento.Text));
            QVoltaZera.SetVariable('DT_FINAL',StrToDate(FZeraExercicio.MeDtLancamento.Text));
{            if Trim(Bib.LimpaString(FZeraExercicio.MEPeriodo.Text,'/')) <> '' then
              QVoltaZera.SetVariable('DT_INICIAL',StrToDate('01/'+
                                                             copy(Trim(Bib.LimpaString(FZeraExercicio.MEPeriodo.Text,'/')),5,2)+'/'+
                                                             copy(Trim(Bib.LimpaString(FZeraExercicio.MEPeriodo.Text,'/')),1,4)));
            if Trim(Bib.LimpaString(FZeraExercicio.MEPeriodo.Text,'/'))<>'' then
              QVoltaZera.SetVariable('DT_FINAL',DMOracle.UltimoDiaMes(StrToDate('01/'+copy(Trim(Bib.LimpaString(FZeraExercicio.MEPeriodo.Text,'/')),5,2)+'/'+copy(Trim(Bib.LimpaString(FZeraExercicio.MEPeriodo.Text,'/')),1,4))));
}           QVoltaZera.SetVariable('COD_HISTORICO_CONTABIL',DMParamSistema.QParamSistemaCOD_HISTORICO_CONTABIL_ZERA_EX.Value);
            QVoltaZera.Open;
            QAtualizaSaldoZera.Close;
            if Trim(FZeraExercicio.MECodFilial.Text)<>'' then
              QAtualizaSaldoZera.SetVariable('COD_FILIAL',StrToInt(Trim(FZeraExercicio.MECodFilial.Text)));
            if Trim(Bib.LimpaString(FZeraExercicio.MEPeriodo.Text,'/'))<>'' then
              QAtualizaSaldoZera.SetVariable('DT_ANO_MES',StrToInt(Bib.LimpaString(FZeraExercicio.MEPeriodo.Text,'/')));
            QAtualizaSaldoZera.ExecSQL;
            QVoltaZera.First;
            while not(QVoltaZera.Eof) do
              begin
                QVoltaZera.delete;
              end;
          end;
          DMoracle.DBCemapa.Commit;
      except
        DMoracle.DBCemapa.RollBack;
        Raise;
      end;
    end;
    FZeraExercicio.Destroy;
    FZeraExercicio:=Nil;
End;

procedure TFLanctoContabilCad.DirioGeral1Click(Sender: TObject);
begin
  inherited;
  if FContabilParam = Nil then
    FContabilParam:=TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[2].TabVisible:=True;
  if FContabilParam.ShowModal=mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContabilParam.ME2CodFilialInicial.Text),'CONTABIL');
      DmUsuario.Checar_Filial_Usuario( Trim(FContabilParam.ME2CodFilialFinal.Text),'CONTABIL');
      with DMPlanilha do
        begin
          QRContabil_Diario.Close;
          QRDiariotot.Close;
          if Trim(FContabilParam.ME2ContaInicial.Text)<>'' then
           Begin
            QRContabil_Diario.SetVariable('CONTA_INICIAL',Trim(FContabilParam.ME2ContaInicial.Text));
            QRDiariotot.SetVariable('CONTA_INICIAL',Trim(FContabilParam.ME2ContaInicial.Text));
           End
          else
           Begin
            QRContabil_Diario.SetVariable('CONTA_INICIAL',Null);
            QRDiariotot.SetVariable('CONTA_INICIAL',Null);
           End;
          if Trim(FContabilParam.ME2ContaFinal.Text)<>'' then
           Begin
            QRContabil_Diario.SetVariable('CONTA_FINAL',Trim(FContabilParam.ME2ContaFinal.Text));
            QRDiariotot.SetVariable('CONTA_FINAL',Trim(FContabilParam.ME2ContaFinal.Text));
           End
          else
           Begin
            QRContabil_Diario.SetVariable('CONTA_FINAL',Null);
            QRDiariotot.SetVariable('CONTA_FINAL',Null);
           End;

          if Trim(bib.LimpaString(FContabilParam.ME2PeriodoInicial.Text,'/'))<>'' then
           Begin
            QRContabil_Diario.SetVariable('PERIODO_INICIAL',StrToInt(Trim(bib.LimpaString(FContabilParam.ME2PeriodoInicial.Text,'/'))));
            QRDiariotot.SetVariable('PERIODO_INICIAL',StrToInt(Trim(bib.LimpaString(FContabilParam.ME2PeriodoInicial.Text,'/'))));
           End
          else
           Begin
            QRContabil_Diario.SetVariable('PERIODO_INICIAL',Null);
            QRDiariotot.SetVariable('PERIODO_INICIAL',Null);
           End;

          if Trim(Trim(bib.LimpaString(FContabilParam.ME2PeriodoFinal.Text,'/')))<>'' then
           Begin
            QRContabil_Diario.SetVariable('PERIODO_FINAL',StrToInt(Trim(bib.LimpaString(FContabilParam.ME2PeriodoFinal.Text,'/'))));
            QRDiariotot.SetVariable('PERIODO_FINAL',StrToInt(Trim(bib.LimpaString(FContabilParam.ME2PeriodoFinal.Text,'/'))));
           End
          else
           Begin
            QRContabil_Diario.SetVariable('PERIODO_FINAL',Null);
            QRDiariotot.SetVariable('PERIODO_FINAL',Null);
           End;

          if Trim(FContabilParam.ME2CodFilialInicial.Text)<>'' then
           Begin
            QRContabil_Diario.SetVariable('FILIAL_INICIAL',StrToInt(Trim(FContabilParam.ME2CodFilialInicial.Text)));
            QRDiariotot.SetVariable('FILIAL_INICIAL',StrToInt(Trim(FContabilParam.ME2CodFilialInicial.Text)));
           End
          else
           Begin
            QRContabil_Diario.SetVariable('FILIAL_INICIAL',Null);
            QRDiariotot.SetVariable('FILIAL_INICIAL',Null);
           End;

          if Trim(FContabilParam.ME2CodFilialFinal.Text)<>'' then
           Begin
            QRContabil_Diario.SetVariable('FILIAL_FINAL',StrToInt(Trim(FContabilParam.ME2CodFilialFinal.Text)));
            QRDiariotot.SetVariable('FILIAL_FINAL',StrToInt(Trim(FContabilParam.ME2CodFilialFinal.Text)));
           End
          else
           Begin
            QRContabil_Diario.SetVariable('FILIAL_FINAL',Null);
            QRDiariotot.SetVariable('FILIAL_FINAL',Null);
           End;
          QRContabil_Diario.SetVariable('DATA_INICIAL',StrToDate(FContabilParam.ME2DtInicial.Text));
          QRContabil_Diario.SetVariable('DATA_FINAL',StrToDate(FContabilParam.ME2Dtfinal.Text));
          QRDiariotot.SetVariable('DATA_INICIAL',StrToDate(FContabilParam.ME2DtInicial.Text));
          QRDiariotot.SetVariable('DATA_FINAL',StrToDate(FContabilParam.ME2Dtfinal.Text));

          QRContabil_Diario.Open;
          QRDiariotot.Open;
          
          If FRContabil_Diario = Nil then
             FRContabil_Diario:=TFRContabil_Diario.Create(Application);
          FRContabil_Diario.Pag_Inicial:=strToInt(Trim(FContabilParam.ME2Pagina.Text))-1;
          FRContabil_Diario.QRLPeriodo.Caption:='PERIODO INICIAL: '+FContabilParam.ME2PeriodoInicial.Text+' FINAL: '+FContabilParam.ME2PeriodoFinal.Text;
          FRContabil_Diario.QRLFilial.Caption:='Filial:' + Trim(FContabilParam.ME2FilialInicial.Text) + '  De '+ FContabilParam.ME2DtInicial.Text + '  Ate ' + FContabilParam.ME2Dtfinal.Text;
          If FContabilParam.RGPreview.ItemIndex=0 then
            FRContabil_Diario.QRPrimario.Preview
          else
            FRContabil_Diario.QRPrimario.Print;
          QRContabil_Diario.Close;
          QRDiariotot.Close;
        end;
    end;
end;

procedure TFLanctoContabilCad.BalanoPatrimonial1Click(Sender: TObject);
var wDataIni, wDataFin: TDate;
  wNotasExplicativas: String;
  wBuscador: TBuscador;
begin
  inherited;
  if FContabilParam = Nil then
    FContabilParam:=TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[3].TabVisible:=True;
  if FContabilParam.ShowModal=mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContabilParam.ME3CodFilial.Text),'CONTABIL');
      with DMPlanilha do
        begin
          QRBalancoPatrimonial.Close;
          QRNotaExplicativa.Close;  //Para trazer no relatorio o descritivo do balanço patrimonial - Junior 27-02-2014.
          if Trim(FContabilParam.ME3CodFilial.text)<>'' then
          begin
            QRBalancoPatrimonial.SetVariable('FILIAL',StrToInt(Trim(FContabilParam.ME3CodFilial.text)));
            QRNotaExplicativa.SetVariable('COD_FILIAL',StrToInt(Trim(FContabilParam.ME3CodFilial.Text)));
          end
          else
          begin
            QRBalancoPatrimonial.SetVariable('FILIAL',Null);
            QRNotaExplicativa.SetVariable('COD_FILIAL', Null);
          end;

          if Trim(FContabilParam.ME3CodFilialFinal.text)<>'' then
            QRBalancoPatrimonial.SetVariable('FILIAL_FINAL',StrToInt(Trim(FContabilParam.ME3CodFilialFinal.text)))
          else
            QRBalancoPatrimonial.SetVariable('FILIAL_FINAL',Null);
          if Trim(Bib.LimpaString(FContabilParam.ME3Periodo.Text,'/')) <> '' then
          begin
            QRBalancoPatrimonial.SetVariable('DT_ANO_MES',StrToInt(Trim(Bib.LimpaString(FContabilParam.ME3Periodo.Text,'/'))));
            QRNotaExplicativa.SetVariable('NUM_ANO', StrToInt(copy(FContabilParam.ME3Periodo.Text,1,4)));
          end
          else
          begin
            QRBalancoPatrimonial.SetVariable('DT_ANO_MES',Null);
          end;

          QRBalancoPatrimonial.SetVariable('NUM_GRAU',StrToInt(FContabilParam.Me3Grau.Text));
          QRBalancoPatrimonial.Open;
          QRNotaExplicativa.Open;
          if FRBalancoPatrimonial = nil then
            FRBalancoPatrimonial := TFRBalancoPatrimonial.Create(Application);

          if FRNotaExplicativa = nil then
            FRNotaExplicativa := TFRNotaExplicativa.Create(Application);

          FRBalancoPatrimonial.Pag_Inicial:=StrToInt(Trim(FContabilParam.ME3Pagina.text))-1;
          FRBalancoPatrimonial.Pag_Inicial_Param:=StrToInt(Trim(FContabilParam.ME3Pagina.text))-1;
          Bib.PriUltDataVar(wDataIni, wDataFin, True, StrToDate('01/' + copy(FContabilParam.ME3Periodo.Text, 6, 2) + '/' + copy(FContabilParam.ME3Periodo.Text, 1, 4)));
          FRBalancoPatrimonial.QRLPeriodo.Caption:='Encerrado em ' + FormatDateTime('dd/MM/yyyy', wDataFin);
          //FRBalancoPatrimonial.QRLFilial.Caption:=FContabilParam.ME3Filial.Text;
          if Trim(FContabilParam.ME3CodFilial.Text) <> '' then
            FRBalancoPatrimonial.QRLFilial.Caption:=FContabilParam.ME3Filial.Text + ' CNPJ:' + DMOracle.FastSelect('NUM_CGC','TB_FILIAL','COD_FILIAL = ' + FContabilParam.ME3CodFilial.Text)
          else
            FRBalancoPatrimonial.QRLFilial.Caption:=FContabilParam.ME3Filial.Text;
          FRBalancoPatrimonial.QRLValorPeriodoAtual.Caption := copy(FContabilParam.ME3Periodo.Text, 1, 4) + '/' + copy(FContabilParam.ME3Periodo.Text, 6, 2);
          FRBalancoPatrimonial.QRLValorPeriodoAnterior.Caption := IntToStr(StrToInt(copy(FContabilParam.ME3Periodo.Text, 1, 4)) -1) + '/' + copy(FContabilParam.ME3Periodo.Text, 6, 2);
          FRBalancoPatrimonial.QRLValorPeriodoAnterior.Enabled := (FContabilParam.Rg3SaldoAnterior.ItemIndex = 0);
          FRBalancoPatrimonial.QRDBText1.Enabled := (FContabilParam.Rg3SaldoAnterior.ItemIndex = 0);
          //Adicionar ao Memo "Nota explicativa p/ balanço patrimonial. Junior - 27/02/2014
          //FRNotaExplicativa.QRMemo1.Lines.Add(QRNotaExplicativaDESC_NOTA_EXPLICATIVA.Value);


          if Trim(FContabilParam.ME3CodFilial.Text) <> '' then
            FRNotaExplicativa.QRLFilial.Caption := FContabilParam.ME3Filial.Text + ' CNPJ:' + DMOracle.FastSelect('NUM_CGC','TB_FILIAL','COD_FILIAL = ' + FContabilParam.ME3CodFilial.Text)
          else
            FRNotaExplicativa.QRLFilial.Caption := FContabilParam.ME3Filial.Text;
          FRNotaExplicativa.QRLEmpresa.Caption := 'Empresa: ' + FContabilParam.ME3Filial.Text;
          FRNotaExplicativa.QRLPeriodo.Caption := 'Encerrado em ' + FormatDateTime('dd/MM/yyyy', wDataFin);

          FRNotaExplicativa.QRRichText1.Lines.Add(QRNotaExplicativaDESC_NOTA_EXPLICATIVA.AsString);


          //          FRBalancoPatrimonial.QRLTipo.Caption:='Até Grau ' + FContabilParam.Me3Grau.Text;
          {if DMParamSistema.CodEmpresa = 'GRASEL' then
          begin
            wBuscador := TBuscador.Create;
            wBuscador.Limpa;
            wBuscador.Adiciona('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + Trim(FContabilParam.ME3CodFilial.text));
            wBuscador.Adiciona('NUM_CGC', 'TB_FILIAL', 'COD_FILIAL = ' + Trim(FContabilParam.ME3CodFilial.text));
            wBuscador.Adiciona('DESC_CIDADE', 'TB_FILIAL', 'COD_FILIAL = ' + Trim(FContabilParam.ME3CodFilial.text));
            wBuscador.Adiciona('COD_ESTADO', 'TB_FILIAL', 'COD_FILIAL = ' + Trim(FContabilParam.ME3CodFilial.text));
            wBuscador.Adiciona('DESC_ENDERECO', 'TB_FILIAL', 'COD_FILIAL = ' + Trim(FContabilParam.ME3CodFilial.text));
            wBuscador.Adiciona('DESC_BAIRRO', 'TB_FILIAL', 'COD_FILIAL = ' + Trim(FContabilParam.ME3CodFilial.text));
            wBuscador.Buscar;

            FRBalancoPatrimonial.QRMemo1.Lines.Add('Notas Explicativas - ' + FContabilParam.ME3Periodo.Text);
            FRBalancoPatrimonial.QRMemo1.Lines.Add('1 - CONTEXTO OPERACIONAL');
            FRBalancoPatrimonial.QRMemo1.Lines.Add(wBuscador.Proximo + ', cadastrada no CNPJ sob número '
              + wBuscador.Proximo + ', tributada pelo Simples');
            FRBalancoPatrimonial.QRMemo1.Lines.Add('Nacional com apuração anual, com ramo de atividade '
              + 'economica principal: Atividades de apoio à agricultura');
            FRBalancoPatrimonial.QRMemo1.Lines.Add('não especificadas anteriormente; ramo de atividade economica secundária: '
              + 'Serviço de preparação de terreno, ');
            FRBalancoPatrimonial.QRMemo1.Lines.Add('cultivo e colheita. Serviço de pulverização e controle de pragas agrícolas. '
            + 'Com sede no Município de');
            FRBalancoPatrimonial.QRMemo1.Lines.Add(wBuscador.Proximo + ' / ' + wBuscador.Proximo + ', ' + wBuscador.Proximo + ' - ' + wBuscador.Proximo
            + '. Com início das atividades em: 09/11/1983');
            FRBalancoPatrimonial.QRMemo1.Lines.Add('2 - POLÍTICA ADOTADA');
            FRBalancoPatrimonial.QRMemo1.Lines.Add('As demonstrações contábeis encerradas em ' + FormatDateTime('dd', wDataFin) + ' de '
            + bib.NomeMes(strtoint(copy(FContabilParam.ME3Periodo.Text, 6, 2))) +' de ' + FormatDateTime('yyyy', wDataFin) + ' e '
            + FormatDateTime('dd', wDataFin) + ' de ' + bib.NomeMes(strtoint(copy(FContabilParam.ME3Periodo.Text, 6, 2)))
            +' de ' + inttostr(strtoint(FormatDateTime('yyyy', wDataFin)) -1) + '(comparativas),');
            FRBalancoPatrimonial.QRMemo1.Lines.Add('aqui compreendidos: Balanço Patrimonial, Demostração do Resultado,'
            + 'Demonstração de Lucros e Prejuizos');
            FRBalancoPatrimonial.QRMemo1.Lines.Add('Acumulados(DLPA) e Demostração dos Fluxos de Caixa(DFC), foram elaboradas a partir'
            + ' das diretrizes contábeis');
            FRBalancoPatrimonial.QRMemo1.Lines.Add('e dos preceitos da Legislação Comercial, Lei nº10.406/2002 e demais legislações'
            + ' aplicáveis e aos Princípios');
            FRBalancoPatrimonial.QRMemo1.Lines.Add('Contábeis.');
          end;
           }

          If FContabilParam.RGPreview.ItemIndex=0 then
            FRBalancoPatrimonial.QRCompositeReport1.Preview
          else
            FRBalancoPatrimonial.QRPrimario.Print;

          QRNotaExplicativa.Close;
          QRBalancoPatrimonial.Close;
          FRBalancoPatrimonial.Destroy;
          FRBalancoPatrimonial:=Nil;
          FRNotaExplicativa.Destroy;
          FRNotaExplicativa := Nil;
        end;
    end;
end;

procedure TFLanctoContabilCad.FazSoma(Tipo,Codigo:String);
Var wSql : String;
begin
  DMPlanilha.QSomaGrid.SQL.Clear;
  if Tipo = 'PLANILHA' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_PLANILHA = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_PLANILHA = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
  if Tipo = 'NOTA' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_NOTA_CAB = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO  = '+Codigo+
                                 ' AND '+
                                 ' COD_NOTA_CAB = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
  if Tipo = 'CONTAS_RECEBER' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_CONTAS_RECEBER_CAB = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_CONTAS_RECEBER_CAB = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
  if Tipo = 'CONTAS_PAGAR' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_CONTA_PAGAR_CAB = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_CONTA_PAGAR_CAB = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
  if Tipo = 'CAIXA' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CAIXA_MOV = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CAIXA_MOV = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
  if Tipo = 'BANCO' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_BCO_MOVIMENTO = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_BCO_MOVIMENTO = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
  if Tipo = 'RPA' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' NUM_RPA = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' NUM_RPA = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
  if Tipo = 'CNH' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CONHECIMENTO_FRETE = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CONHECIMENTO_FRETE = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
  if Tipo = 'EST' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_ESTADIA = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_ESTADIA = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
   if Tipo = 'OBRA' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_OBRA = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_OBRA = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
   if Tipo = 'CAIXA_TRANSF' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CAIXA_TRANSF_CAB = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CAIXA_TRANSF_CAB = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
   if Tipo = 'CCFUTURA' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CONTRATO = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CONTRATO = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
   if Tipo = 'CGPRECO' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CONTRATO_GP = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CONTRATO_GP = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
   if Tipo = 'CVENDA' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CONTRATO_VEND = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CONTRATO_VEND = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
   if Tipo = 'ARROZ' then
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CONTRATO_ARROZ = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_CONTRATO_ARROZ = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');
   if Tipo = 'IND' then  //INDUSTRIA
    DMPlanilha.QSomaGrid.SQL.Add('SELECT SUM(CREDITO) AS CREDITO, '+
                                 'SUM(DEBITO) AS DEBITO, '+
                                 'SUM(CREDITO)+SUM(DEBITO) AS SALDO '+
                                 'FROM '+
                                 '( SELECT SUM(VAL_LANCAMENTO) AS CREDITO, '+
                                 ' TO_NUMBER('+#39+'0'+#39+') AS DEBITO '+
                                 ' FROM '+
                                 ' TB_LANCTO_CONTABIL Tb_lancto_contabil'+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_BOLETIM_INDUSTRIA = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'C'+#39+') '+
                                 ' UNION '+
                                 ' SELECT TO_NUMBER('+#39+'0'+#39+') AS CREDITO, '+
                                 ' SUM(VAL_LANCAMENTO) AS DEBITO '+
                                 ' FROM TB_LANCTO_CONTABIL Tb_lancto_contabil '+
                                 ' WHERE '+
                                 ' COD_GENERICO = '+Codigo+
                                 ' AND '+
                                 ' COD_BOLETIM_INDUSTRIA = '+Codigo+
                                 ' AND '+
                                 ' (IND_OPERACAO = '+#39+'D'+#39+'))');

end;

procedure TFLanctoContabilCad.RelatrioMovPConferncia1Click(
  Sender: TObject);
begin
  inherited;
  if FContabilParam = Nil then
    FContabilParam:=TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[4].TabVisible:=True;
  if FContabilParam.ShowModal=mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContabilParam.ME4CodFilial.Text),'CONTABIL');
      with DMPlanilha do
        begin
          QRLanctoMov.Close;
          if FrContabilMovConf = nil then
            FrContabilMovConf := TFrContabilMovConf.Create(Application);
          if Trim(FContabilParam.ME4CodFilial.text)<>'' then
            QRLanctoMov.SetVariable('FILIAL',StrToInt(Trim(FContabilParam.ME4CodFilial.text)))
          else
            QRLanctoMov.SetVariable('FILIAL',Null);
          QRLanctoMov.SetVariable('DATA_INICIAL',StrToDate(FContabilParam.ME4Inicial.text));
          QRLanctoMov.SetVariable('DATA_FINAL',StrToDate(FContabilParam.ME4Final.text));
          Case FContabilParam.Rg4Tipo.ItemIndex of
             0 :
              Begin
                QRLanctoMov.SetVariable('OPERACAO','D');
                FrContabilMovConf.QRLConta1.Caption:='DEBITO';
                FrContabilMovConf.QRLConta2.Caption:='CREDITO';
              End;
             1 :
              Begin
                QRLanctoMov.SetVariable('OPERACAO','C');
                FrContabilMovConf.QRLConta1.Caption:='CREDITO';
                FrContabilMovConf.QRLConta2.Caption:='DEBITO';
              End;
             2 : QRLanctoMov.SetVariable('OPERACAO',Null);
          End;
          QRLanctoMov.Open;
          FrContabilMovConf.QRLFilial.Caption:='Filial: '+FContabilParam.ME4Filial.Text;
          FrContabilMovConf.QRLTitulo.Caption:='Relatorio Movimento P/Conferencia de '+FContabilParam.ME4Inicial.Text + '  Ate  ' +FContabilParam.ME4Final.Text;
          If FContabilParam.RGPreview.ItemIndex=0 then
            FrContabilMovConf.QRPrimario.Preview
          else
            FrContabilMovConf.QRPrimario.Print;
          QRLanctoMov.Close;
          FrContabilMovConf.Destroy;
          FrContabilMovConf:=Nil;
        end;
    end;
end;

procedure TFLanctoContabilCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  BtInclusao.Enabled:=True;
  BtAlteracao.Enabled:=True;
  BtExclusao.Enabled:=True;
  FLanctoContabilCad.DBEdit13.ReadOnly :=  True;
  FLanctoContabilCad.DBEFilial.ReadOnly :=  True;
  FLanctoContabilCad.DBEdit8.ReadOnly :=  True;
  FLanctoContabilCad.MECodReduzido.ReadOnly :=  True;
  FLanctoContabilCad.MENumConta.ReadOnly :=  True;
  FLanctoContabilCad.DBRGOperacao.ReadOnly :=  True;
  FLanctoContabilCad.DBEdit12.ReadOnly :=  True;
  FLanctoContabilCad.DBEdit10.ReadOnly :=  True;

end;

procedure TFLanctoContabilCad.DBGLancCellClick(Column: TColumn);
begin
  inherited;
  BtInclusao.Enabled:=True;
  BtAlteracao.Enabled:=True;
  BtExclusao.Enabled:=True;
end;

procedure TFLanctoContabilCad.AtualizaSaldoMensal1Click(Sender: TObject);
begin
  inherited;
  if FAtualizaSaldo = Nil then
    FAtualizaSaldo := TFAtualizaSaldo.Create(Application);
  FAtualizaSaldo.encerramento := False;
  try
    FAtualizaSaldo.ShowModal;
    FAtualizaSaldo.Destroy;
    FAtualizaSaldo:=Nil;
    MessageDlg('Atualização de Saldos Mês Gerados com Sucesso!',mtInformation,[mbOk],0);
  Except
  end;
end;

procedure TFLanctoContabilCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(6);
end;

procedure TFLanctoContabilCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPlanoConta.QPlanoConta.Close;
  DMPlanilha.QSomaGrid.Close;
  DMPlanilha.QLanctoContabilCad.Close;
  Action := CaFree;
  FLanctoContabilCad := Nil;
end;

procedure TFLanctoContabilCad.ResumoAnual1Click(Sender: TObject);
begin
  inherited;
  if FContabilParam = Nil then
    FContabilParam:=TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[7].TabVisible:=True;
  if FContabilParam.ShowModal=mrOk then
    begin
       with DMPlanilha do
        begin
          QRResumoAnual.Close;
          if Trim(FContabilParam.ME7Filial.text)<>'' then
            QRResumoAnual.SetVariable('FILIAL',StrToInt(FContabilParam.ME7Filial.text))
          else
            QRResumoAnual.SetVariable('FILIAL',Null);
          if Trim(FContabilParam.ME7Ano.Text) = '' then
            raise exception.create ('O Ano precisa ser informado');
          QRResumoAnual.SetVariable('ANO_MES_I',Trim(FContabilParam.ME7Ano.Text)+'01');
          QRResumoAnual.SetVariable('ANO_MES_F',Trim(FContabilParam.ME7Ano.Text)+'12');

          QRResumoAnual.Open;
          if FRResumoAnual = nil then
            FRResumoAnual := TFRResumoAnual.Create(Application);
          FRResumoAnual.QRLPeriodo.Caption:='Ano : '+copy(FContabilParam.ME7Ano.Text,1,4);
          FRResumoAnual.QRLFilial.Caption:='Filial: '+FContabilParam.ME7Filial.Text + ' - ' + FContabilParam.Ed7Filial.Text;

          If FContabilParam.RGPreview.ItemIndex=0 then
            FRResumoAnual.QRPrimario.Preview
          else
            FRResumoAnual.QRPrimario.Print;
          QRResumoAnual.Close;
          FRResumoAnual.Destroy;
          FRResumoAnual:=Nil;
        end;
 end;
end;

procedure TFLanctoContabilCad.SaldoContabil1Click(Sender: TObject);
Var Day,Month,Year:Word;
    wAnoMes,wSaldo,wCodPlanoConta : String;
begin
  inherited;
  If FContabilParam=Nil then
    FContabilParam:=TFContabilParam.Create(Application);
  FContabilParam.PGRelatorio.Pages[10].TabVisible:=True;
  If FContabilParam.ShowModal=MrOk then
    begin
      with DMRelContabil do
        begin
          QRSaldo.Close;
          wCodPlanoConta := DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+FContabilParam.ME10ContaInicial.Text+chr(39));
          if Trim(FContabilParam.ME10DtInicial.Text) = '' then
            Raise Exception.Create('Campo Data Inicial Deve Ser Informado');
          DecodeDate(StrToDate(FContabilParam.ME10DtInicial.Text),Year,Month,Day);
          QRSaldo.SetVariable('DT_INICIAL',StrToDate('01/'+IntToStr(Month)+'/'+IntToStr(Year)));  //envia a SQL o Dia anterior ao informado
          QRSaldo.SetVariable('DT_FINAL',StrToDate(FContabilParam.ME10DtInicial.Text)-1);  //envia a SQL o Dia anterior ao informado
          if Trim(FContabilParam.ME10Filial.Text)<>'' then
            QRSaldo.SetVariable('FILIAL',StrToInt(Trim(FContabilParam.ME10Filial.Text)))
          else
            QRSaldo.SetVariable('FILIAL',Null);
          QRSaldo.SetVariable('CONTA',wCodPlanoConta);  //envia a SQL o Dia anterior ao informado

          QRSaldo.Open;
          Month := Month - 1;
          If Month < 1 then
           Begin
             Month := 12;
             Year := Year - 1;
           End;
          wAnoMes := IntToStr(Year) + Bib.StrZero(IntToStr(Month),2);
          wCodPlanoConta := DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+FContabilParam.ME10ContaInicial.Text+chr(39));
          wSaldo := DMOracle.BuscaNome('SELECT VAL_ATUAL FROM TB_SALDO_CONTABIL','COD_PLANO_CONTA = '+ wCodPlanoConta + ' And Cod_Filial = ' + Trim(FContabilParam.ME10Filial.Text) +
                           ' And DT_ANO_MES = ' + wAnoMes);
          QRSaldoContabil.Close;

          if Trim(FContabilParam.ME10Filial.Text)<>'' then
            QRSaldoContabil.SetVariable('FILIAL',StrToInt(Trim(FContabilParam.ME10Filial.Text)))
          else
            QRSaldoContabil.SetVariable('FILIAL',Null);

          if Trim(FContabilParam.ME10DtInicial.Text)= '' then
            Raise Exception.Create('A data inicial deve ser informada!');
          QRSaldoContabil.SetVariable('DT_INICIAL',StrToDate(FContabilParam.ME10DtInicial.Text));
          if Trim(FContabilParam.ME10DtFinal.Text)= '' then
            Raise Exception.Create('A data final deve ser informada!');
          QRSaldoContabil.SetVariable('DT_FINAL',StrToDate(FContabilParam.ME10DtFinal.Text));
          if Trim(FContabilParam.ME10Containicial.Text)<> '' then
            QRSaldoContabil.SetVariable('CONTA_INICIAL',(Trim(FContabilParam.ME10ContaInicial.Text)))
          else
            QRSaldoContabil.SetVariable('CONTA_INICIAL',Null);
          QRSaldoContabil.Open;
          if FRSaldoContabil = Nil then
            FRSaldoContabil:=TFRSaldoContabil.Create(Application);
          FRSaldoContabil.wSaldoMesAnterior := StrToFloat(wSaldo) + DMRelContabil.QRSaldoCredito.Value + DMRelContabil.QRSaldoDebito.Value;
//          FRSaldoContabil.QRLSaldoAnterior.Caption:=FormatFloat('#,##0.00',(QRSaldoCredito.Value+QRSaldoDebito.Value+StrToFloat(wSaldo)));
          FRSaldoContabil.QRLPeriodo.Caption:='Periodo de: '+FContabilParam.ME10DtInicial.Text+' até: '+FContabilParam.ME10DtFinal.Text;
          FRSaldoContabil.QRLFilial.Caption:=('Filial:' +FContabilParam.ME10Filial.Text+ ' ' + FContabilParam.Ed10Filial.Text);
          FRSaldoContabil.QRLConta.Caption:='Conta:' +FContabilParam.ME10ContaInicial.Text+ ' ' + FContabilParam.Ed10ContaInicial.Text;
          If FContabilParam.RGPreview.ItemIndex=0 then
            FRSaldoContabil.QRPrimario.Preview
          Else
            FRSaldoContabil.QRPrimario.Print;
          QRSaldoContabil.Close;
          QRSaldo.Close;
        end;
     end;
end;

procedure TFLanctoContabilCad.AtualizaSaldodeEncerramento1Click(
  Sender: TObject);
begin
  inherited;
  if FAtualizaSaldo = Nil then
    FAtualizaSaldo := TFAtualizaSaldo.Create(Application);
  FAtualizaSaldo.encerramento := True;
  FAtualizaSaldo.ShowModal;
  FAtualizaSaldo.Destroy;
  FAtualizaSaldo:=Nil;
end;

procedure TFLanctoContabilCad.Atualizacontabilidadegrasel1Click(
  Sender: TObject);
//Var wComando : String;
Var wTab_Plano : Array[1..500] of Reg_Plano;
  wI, wFilial,wCod_Num_Conta : Integer;
  wNum_Conta : String;
  wAno: String;
  wMes: Integer;
  wAnoServ,wMesServ,wDiaServ: word;
begin
  inherited;
{  With DMPlanilha do
   Begin
     QAtualizaGrasel.Close;
     QAtualizaGrasel.SetVariable('Dt_Inicial','01/01/2009');
     QAtualizaGrasel.SetVariable('Dt_Final','21/04/2010');
     QAtualizaGrasel.Open;
     Try
       DMOracle.DBCemapa.StartTransaction;
       While not(QAtualizaGrasel.Eof) do
       Begin
          DMOracle.QExecSQL.Close;
          DMOracle.QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_LANCTO_CONTABIL SET COD_PLANO_CONTA = ' + QAtualizaGraselCod_Plano_Conta_Novo.Text;
          wComando := wComando + ' WHERE COD_LANCTO_CONTABIL = '+QAtualizaGraselCOD_LANCTO_CONTABIL.Text;
          DMOracle.QExecSQL.SQL.Add(wComando);
          DMOracle.QExecSQL.ExecSQL;
          QAtualizaGrasel.Next;
       End;
       DMOracle.DBCemapa.Commit;
     except
       DMOracle.DBCemapa.Rollback;
       Raise Exception.Create('Não foi possível incluir o saldo para esta conta.');
     end;
   End;
}
{  With DMPlanilha do
   Begin
     wFilial := 1;
     QAtualizaGrasel.Close;
     QAtualizaGrasel.SetVariable('Cod_Filial',wFilial);
     QAtualizaGrasel.Open;
     with DMPlanoConta do
     begin
       QRPlanoContas.SetVariable('COD_FILIAL_INICIAL',Null);
       QRPlanoContas.SetVariable('COD_FILIAL_FINAL',Null);
       QRPlanoContas.SetVariable('NUM_PLANO_CONTA_INICIAL',Null);
       QRPlanoContas.SetVariable('NUM_PLANO_CONTA_FINAL',Null);
       QRPlanoContas.SetVariable('IND_LIBERADO_USO',Null);
       QRPlanoContas.SetVariable('NUM_GRAU',5);
       QRPlanoContas.Open;
       wI := 1;
       While not(QRPlanoContas.Eof) do
       Begin
         wTab_Plano[wI].wCod_Plano_Plano := QRPlanoContasCod_Plano_Conta.Value;
         wTab_Plano[wI].wValor := 0;
         Inc(wI);
         QRPlanoContas.Next;
       End;
     End;
     QAtualizaGrasel.First;
     Try
       DMOracle.DBCemapa.StartTransaction;
       While not(QAtualizaGrasel.Eof) do
       Begin
          wNum_Conta := DMPlanilha.NivelSuperior(QAtualizaGraselNum_Plano_Conta.Value);
          While wNum_Conta <> '' Do
           Begin
             wCod_Num_Conta := DMPlanilha.CodConta(wFilial,wNum_Conta);
             wI := 1;
             While wTab_Plano[wI].wCod_Plano_Plano <> wCod_Num_Conta Do
               Inc(wI);
             wTab_Plano[wI].wValor := wTab_Plano[wI].wValor + QAtualizaGraselVal_Anterior.Value;
             wNum_Conta := DMPlanilha.NivelSuperior(wNum_Conta);
           End;
          QAtualizaGrasel.Next;
       End;
       wI := 1;
       While (wTab_Plano[wI].wCod_Plano_Plano <> Null) And
             (wTab_Plano[wI].wCod_Plano_Plano <> 0)    Do
       Begin
          QSaldoContabil.Close;
          QSaldoContabil.SetVariable('COD_CONTA',wTab_Plano[wI].wCod_Plano_Plano);
          QSaldoContabil.SetVariable('FILIAL',wFilial);
          QSaldoContabil.SetVariable('ANO_MES',200901);
          QSaldoContabil.Open;
          If QSaldoContabil.Eof Then
           Begin
             QSaldoContabil.Insert;
             QSaldoContabilDt_Ano_Mes.Value:=200999;
             QSaldoContabilCod_Plano_Conta.Value:=wTab_Plano[wI].wCod_Plano_Plano;
             QSaldoContabilCod_Filial.Value:=wFilial;
             QSaldoContabilVal_Anterior.Value:=wTab_Plano[wI].wValor;
             QSaldoContabilVal_Credito.Value:=0;
             QSaldoContabilVal_Debito.Value:=0;
             QSaldoContabilVal_Atual.Value:=0;
           End
          Else
           Begin
             QSaldoContabil.Edit;
             QSaldoContabilVal_Anterior.Value:=wTab_Plano[wI].wValor;
           End;
          QSaldoContabil.Post;
          Inc(wI);
       End;
       DMOracle.DBCemapa.Commit;
     except
       DMOracle.DBCemapa.Rollback;
       Raise Exception.Create(IntToStr(wTab_Plano[wI].wCod_Plano_Plano));
     end;
   End;
}

  if Trim(InputBox('Autorização necessária','Digite a senha do Administrador',
    '')) = Trim(DMOracle.FastSelect('DESC_SENHA_OFICINA','TB_PARAM_SISTEMA')) then
  begin
    if FAtualizaSaldo = Nil then
      FAtualizaSaldo := TFAtualizaSaldo.Create(Application);
    wAno := InputBox('Atenção','Informe o ano a ser atualizado',
      copy(DateToStr(DMOracle.DataServ),7,4));

    if Length(wAno) < 4 then
    begin
      MessageDlg('Ano informado incorretamente',mtError,[mbOk],0);
      Abort;
    end;
    if (MessageDlg('Ao prosseguir os saldos do ano inteiro serão calculados novamente. Deseja realmente prosseguir?',
      mtInformation,[mbYes,mbNo],0) = mrNo) then
      Abort;
    DecodeDate(DMOracle.DataServ,wAnoServ,wMesServ,wDiaServ);
    with DMFilial do
    begin
      QRFilial.Close;
      QRFilial.Open;
      while not QRFilial.Eof do
      begin
        for wMes:=1 to 12 do
        begin
          if Int(wAnoServ) = StrToInt(wAno) then
            if Int(wMesServ) <= wMes then
              continue;
          ViradadeMs1Click(TObject(wAno+FormatFloat('00',wMes)));
          FAtualizaSaldo.MECodFilial.Text := QRFilialCOD_FILIAL.Text;
          FAtualizaSaldo.MEAnoMes.Text := wAno + '/' + FormatFloat('00',wMes);
          FAtualizaSaldo.BitBtn1Click(self);
        end;
        QRFilial.Next;
      end;
    end;
  end;
end;

end.
