unit UOSPatrimonio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, VARIANTS;

type
  TFOSPatrimonio = class(TFTCadSimples)
    Label8: TLabel;
    DBEDT_Prevista: TDBEdit;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    BTDepartamento: TBitBtn;
    BTPrioridade: TBitBtn;
    BTServico: TBitBtn;
    BTPatrimonio: TBitBtn;
    BTFuncionario: TBitBtn;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBGrid1: TDBGrid;
    BTProcedimento: TBitBtn;
    DBEdit15: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    RelatrioOS1: TMenuItem;
    DBEdit17: TDBEdit;
    Opes1: TMenuItem;
    EncerramentoOrdemServio1: TMenuItem;
    HistricoItemPatrimonio1: TMenuItem;
    RelaoOSAberta1: TMenuItem;
    Label17: TLabel;
    DBEdit9: TDBEdit;
    DBEdit18: TDBEdit;
    Label18: TLabel;
    DBEDNumDias: TDBEdit;
    DBNavigator1: TDBNavigator;
    ImpressoFormulrio1: TMenuItem;
    DBEdit2: TDBEdit;
    N2: TMenuItem;
    OScomDataPrevistapHoje1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTPrioridadeClick(Sender: TObject);
    procedure BTFuncionarioClick(Sender: TObject);
    procedure BTDepartamentoClick(Sender: TObject);
    procedure BTPatrimonioClick(Sender: TObject);
    procedure BTProcedimentoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatrioOS1Click(Sender: TObject);
    procedure EncerramentoOrdemServio1Click(Sender: TObject);
    procedure BTServicoClick(Sender: TObject);
    procedure HistricoItemPatrimonio1Click(Sender: TObject);
    procedure RelaoOSAberta1Click(Sender: TObject);
    procedure DBEDNumDiasExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ImpressoFormulrio1Click(Sender: TObject);
    procedure OScomDataPrevistapHoje1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOSPatrimonio: TFOSPatrimonio;

implementation

uses UOSPatrimonio_cl, UPrioridadeCons, UPrioridade_cl, UFFuncionarioCons,
  UFuncionario_cl, UDepartamentoCons, UDepartamento_cl, UPatrimonioItemCons,
  Upatrimonio_cl, UProcedimentoCons, UProcedimento_cl, UOSPatrimonioCons,
  UROSPatrimonio, UPatrimonio_Param, UEncerramentoOS, UTipoServicoCons,
  UTipoServico_cl, UAgendaOS, URHistoricoEquipamento, UROSAberto,
  UEncerramentoDescAtividade, URFormularioOS, UOracle_cl, UOSdoDia;

{$R *.DFM}

procedure TFOSPatrimonio.FormActivate(Sender: TObject);
begin
  inherited;
  DMOSPatrimonio.QOSPatrimonio.open;
  DMOSPatrimonio.QOSPatrimonioItem.open;
end;

procedure TFOSPatrimonio.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
    begin
       BTServico.enabled:=true;
       BTFuncionario.enabled:=true;
       BTPrioridade.enabled:=true;
       BTDepartamento.enabled:=true;
       BTPatrimonio.enabled:=true;
  end
  Else
    begin
       BTServico.enabled:=false;
       BTFuncionario.enabled:=false;
       BTPrioridade.enabled:=false;
       BTDepartamento.enabled:=false;
       BTPatrimonio.enabled:=false;
    end;
end;

procedure TFOSPatrimonio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action :=CaFree;
  FOSPatrimonio:=nil;
end;

procedure TFOSPatrimonio.BTPrioridadeClick(Sender: TObject);
begin
  inherited;
  If FPrioridadeCons = Nil then
    FPrioridadeCons := TFPrioridadeCons.Create(Application);
  If FPrioridadeCons.showModal = mrOk then
    DMOSPatrimonio.QOSPatrimonioCod_Prioridade.Value := DMPrioridade.QPrioridadeConsCod_Prioridade.Value;

end;

procedure TFOSPatrimonio.BTFuncionarioClick(Sender: TObject);
begin
  inherited;
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.showModal = mrOk then
    DMOSPatrimonio.QOSPatrimonioCod_Funcionario.Value := DMFuncionario.QFuncionarioConsCod_Funcionario.Value;
end;

procedure TFOSPatrimonio.BTDepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
    DMOSPatrimonio.QOSPatrimonioCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;
end;

procedure TFOSPatrimonio.BTPatrimonioClick(Sender: TObject);
begin
  inherited;
  If FPatrimonioItemCons = Nil then
    FPatrimonioItemCons := TFPatrimonioItemCons.Create(Application);
  If FPatrimonioItemCons.showModal = mrOk then
    DMOSPatrimonio.QOSPatrimonioCod_Patrimonio_Item.Value := DMPatrimonio.QPatrimonio_Item_ConsCod_Patrimonio_Item.Value;

end;

procedure TFOSPatrimonio.BTProcedimentoClick(Sender: TObject);
begin
  inherited;
  If FProcedimentoCons = Nil then
    FProcedimentoCons := TFProcedimentoCons.Create(Application);
  If FProcedimentoCons.showModal = mrOk then
    DMOSPatrimonio.QOSPatrimonioItemCod_Procedimento.value := DMProcedimento.QProcedimentoConsCod_Procedimento_Cab.Value;

end;

procedure TFOSPatrimonio.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FOSPatrimonioCons = Nil then
    FOSPatrimonioCons := TFOSPatrimonioCons.Create(Application);
  If FOSPatrimonioCons.ShowModal = mrOk then
 With DMOSPatrimonio do
  Begin
    QOSPatrimonio.Close;
    QOSPatrimonio.SetVariable('PK',QOSPatrimonioConsNum_OS_Cab.Value);
    QOSPatrimonio.Open;
  End;
end;

procedure TFOSPatrimonio.RelatrioOS1Click(Sender: TObject);
begin
  inherited;
  If FPatrimonio_Param = Nil then
     FPatrimonio_Param := TFPatrimonio_Param.Create(Application);
  FPatrimonio_Param.PGRelatorio.Pages[2].TabVisible := True;
  if FPatrimonio_Param.ShowModal = mrOk then
  with DMOSPatrimonio do
  begin
    QROSPatrimonio.Close;
    if Trim(FPatrimonio_Param.MENumOS.text) <> '' then
      QROSPatrimonio.setvariable('NUM_OS_CAB',FPatrimonio_Param.MENumOS.text)
    else
      QROSPatrimonio.setvariable('NUM_OS_CAB',NULL);
    if Trim(FPatrimonio_Param.EDPrioridade.text) <> '' then
      QROSPatrimonio.setvariable('COD_PRIORIDADE',FPatrimonio_Param.EDPrioridade.text)
    else
      QROSPatrimonio.setvariable('COD_PRIORIDADE',NULL);
    if Trim(FPatrimonio_Param.EDDepartamento.text) <> '' then
      QROSPatrimonio.setvariable('COD_DEPARTAMENTO',FPatrimonio_Param.EDDepartamento.text)
    else
      QROSPatrimonio.setvariable('COD_DEPARTAMENTO',NULL);
    if Trim(FPatrimonio_Param.EDSupervisor.text) <> '' then
      QROSPatrimonio.setvariable('COD_FUNCIONARIO',FPatrimonio_Param.EDSupervisor.text)
    else
      QROSPatrimonio.setvariable('COD_FUNCIONARIO',NULL);
    if Trim(FPatrimonio_Param.MEDT_Ini.text)<> '' then
      QROSPatrimonio.setvariable('DT_ENCERRAMENTO_I',FPatrimonio_Param.MEDT_Ini.text)
    else
      QROSPatrimonio.setvariable('DT_ENCERRAMENTO_I',NULL);
    if Trim(FPatrimonio_Param.MEDT_Fim.text) <> '' then
      QROSPatrimonio.setvariable('DT_ENCERRAMENTO_F',FPatrimonio_Param.MEDT_Fim.text)
    else
      QROSPatrimonio.setvariable('DT_ENCERRAMENTO_F',NULL);
    if Trim(FPatrimonio_Param.EDTipoServico.text) <> '' then
      QROSPatrimonio.setvariable('COD_TIPO_SERVICO',FPatrimonio_Param.EDTipoServico.text)
    else
      QROSPatrimonio.setvariable('COD_TIPO_SERVICO',NULL);
   QROSPatrimonio.Open;
   If FROSPatrimonio = Nil then
       FROSPatrimonio := TFROSPatrimonio.Create(Application);
    if FPatrimonio_Param.RGPreview.ItemIndex = 0 then
      FROSPatrimonio.QRPrimario.Preview
    else
      FROSPatrimonio.QRPrimario.Print;
    QROSPatrimonio.Close;
  End;

end;

procedure TFOSPatrimonio.EncerramentoOrdemServio1Click(Sender: TObject);
Begin
  inherited;
  with DMOSPatrimonio do
  Begin
    if QOSPatrimonioNum_OS_CAB.text <> '' then
    begin
      if QOSPatrimonioDT_Encerramento.Text = '' then //----verifica se a OS esta aberta
      Begin
      //  DMOracle.DBCemapa.StartTransaction;
        if FEncerramentoDescAtividade = nil then
           FEncerramentoDescAtividade:=TFEncerramentoDescAtividade.create(application);
        if FEncerramentoDescAtividade.showmodal = mrOk then
        begin
          QOSPatrimonio.edit;
          QOSPatrimonioDT_Encerramento.value:=StrToDate(FEncerramentoDescAtividade.MEEncerramento.text);
          QOSPatrimonio.post;
          if (QOSPatrimonioCod_Tipo_Servico.value = 'PREV') then //----verifica se a OS é do tipo preventiva
          Begin
            QOSPatrimonioCons.close;
            QOSPatrimonioCons.setVariable('Num_OS_Cab',QOSPatrimonioNum_OS_Cab.value);
            QOSPatrimonioCons.open;
            QOSPatrimonio.insert; //-----inicia a gravação de uma nova OS Preventiva
            QOSPatrimonioDesc_os_patrimonio.value:=QOSPatrimonioConsDesc_os_patrimonio.value;
            QOSPatrimoniocod_departamento.value:=QOSPatrimonioConsCod_Departamento.value;
            QOSPatrimonioCod_Funcionario.value:=QOSPatrimonioConsCod_Funcionario.value;
            QOSPatrimonioCod_Patrimonio_Item.value:=QOSPatrimonioConsCod_Patrimonio_Item.value;
            QOSPatrimonioCod_Prioridade.value :=QOSPatrimonioConsCod_Prioridade.value;
            QOSPatrimonioCod_Tipo_Servico.value:=QOSPatrimonioConsCod_Tipo_Servico.value;
            QOSPatrimonioDT_Emissao.value:= QOSPatrimonioConsDT_Encerramento.value;
            QOSPatrimonioNum_Dias.value:=QOSPatrimonioConsNum_Dias.value;
            QOSPatrimonioDT_Prevista.value:=(QOSPatrimonioConsDT_Encerramento.value + QOSPatrimonioConsNum_dias.value);
            QOSPatrimonio.post;

            QOSPatrimonioItemCons.close;//------Inicia a gravacao da OS Item
            QOSPatrimonioItemCons.setVariable('Num_OS_Cab',QOSPatrimonioConsNum_OS_Cab.value);
            QOSPatrimonioItemCons.Open;
            QOSPatrimonioItem.close;//------fecha query de gravacao de items....grava os procedimentos
            QOSPatrimonioItem.setVariable('Num_OS_Cab',QOSPatrimonioNum_OS_Cab.value);
            QOSPatrimonioItem.Open;

            While not (QOSPatrimonioItemCons.Eof) do //--------loop responsavel pela duplicação dos procedimentos
            Begin
              DSOSPatrimonioItem.Enabled:=false;
              QOSPatrimonioItem.Insert;
              QOSPatrimonioItemNum_OS_Cab.value:=QOSPatrimonioNum_OS_Cab.value;
              QOSPatrimonioItemCod_Procedimento.value:=QOSPatrimonioItemConsCod_Procedimento.value;
              QOSPatrimonioItem.post;
              QOSPatrimonioItemCons.next;
           end;
             DSOSPatrimonioItem.Enabled:=true;
          end;
        //  DMOracle.DBCemapa.Commit;
        end
        else
        //  DMOracle.DBCemapa.RollBack;
      end
      else
        showmessage('Ordem de Serviço já Baixada');
    end
    else
      showmessage('É necessario carregar uma Ordem de Serviço');
  end;
end;

procedure TFOSPatrimonio.BTServicoClick(Sender: TObject);
begin
  inherited;
  If FTipoServicoCons = Nil then
    FTipoServicoCons := TFTipoServicoCons.Create(Application);
  If FTipoServicoCons.showModal = mrOk then
    DMOSPatrimonio.QOSPatrimonioCod_Tipo_Servico.Value := DMTipoServico.QTipoServicoConsCod_Tipo_Servico.Value;
end;

procedure TFOSPatrimonio.HistricoItemPatrimonio1Click(Sender: TObject);
begin
  inherited;
  If FPatrimonio_Param = Nil then
     FPatrimonio_Param := TFPatrimonio_Param.Create(Application);
  FPatrimonio_Param.PGRelatorio.Pages[3].TabVisible := True;
  if FPatrimonio_Param.ShowModal = mrOk then
  with DMOSPatrimonio do
  begin
    QRHistoricoEquipamento.Close;
    if (FPatrimonio_Param.MEPatrimonioItem.text <> '') then
      QRHistoricoEquipamento.setvariable('COD_PATRIMONIO_ITEM',FPatrimonio_Param.MEPatrimonioItem.text)
    else
      QRHistoricoEquipamento.setvariable('COD_PATRIMONIO_ITEM',NULL);
    QRHistoricoEquipamento.Open;
    If FRHistoricoEquipamento = Nil then
       FRHistoricoEquipamento := TFRHistoricoEquipamento.Create(Application);
    if FPatrimonio_Param.RGPreview.ItemIndex = 0 then
      FRHistoricoEquipamento.QRPrimario.Preview
    else
      FRHistoricoEquipamento.Print;
    QROSPatrimonio.Close;
  End;
end;

procedure TFOSPatrimonio.RelaoOSAberta1Click(Sender: TObject);
begin
  inherited;
  If FPatrimonio_Param = Nil then
    FPatrimonio_Param := TFPatrimonio_Param.Create(Application);
  FPatrimonio_Param.PGRelatorio.Pages[4].TabVisible := True;
  if FPatrimonio_Param.ShowModal = mrOk then
  with DMOSPatrimonio do
  begin
    if FROSAberto = Nil then
       FROSAberto := TFROSAberto.Create(Application);
    if (FPatrimonio_Param.MEDepartamento.text <> '') then
      QROSAberto.setvariable('COD_DEPARTAMENTO',FPatrimonio_Param.MEDepartamento.text)
    else
      QROSAberto.setvariable('COD_DEPARTAMENTO',NULL);
    if (FPatrimonio_Param.METipoServico.text <> '') then
      QROSAberto.setvariable('COD_TIPO_SERVICO',FPatrimonio_Param.METipoServico.text)
    else
      QROSAberto.setvariable('COD_TIPO_SERVICO',NULL);
    if (FPatrimonio_Param.MEDT_I.text <> '') then
      QROSAberto.setvariable('DT_PREVISTA_I',FPatrimonio_Param.MEDT_I.text)
    else
      QROSAberto.setvariable('DT_PREVISTA_I',NULL);
    if (FPatrimonio_Param.MEDT_F.text <> '') then
      QROSAberto.setvariable('DT_PREVISTA_F',FPatrimonio_Param.MEDT_F.text)
    else
      QROSAberto.setvariable('DT_PREVISTA_F',NULL);
    if (FPatrimonio_Param.MEPrioridade.text <> '') then
      QROSAberto.setvariable('COD_PRIORIDADE',FPatrimonio_Param.MEPrioridade.text)
    else
      QROSAberto.setvariable('COD_PRIORIDADE',NULL);
    if (FPatrimonio_Param.MESupervisor.text <> '') then
      QROSAberto.setvariable('COD_Funcionario',FPatrimonio_Param.MESupervisor.text)
    else
      QROSAberto.setvariable('COD_Funcionario',NULL);

   QROSAberto.open;
   FROSAberto.QRPrimario.preview;
   QROSAberto.close;
 end;
end;

procedure TFOSPatrimonio.DBEDNumDiasExit(Sender: TObject);
begin
  inherited;
  if (DBedit9.text <> '')and(DBEDNumDias.text <> '') then
    DBEDT_Prevista.text:= DateToStr(StrToDate(DBEdit9.text)+ StrToFloat(DBEDNumDias.text));
end;

procedure TFOSPatrimonio.DBGrid1CellClick(Column: TColumn);
var
  texto :string;
begin
  inherited;
  texto:='';
  if DMOSPatrimonio.QOSPatrimonioItemDesc_Observacao.value <> '' then
    texto:=Texto+DMOSPatrimonio.QOSPatrimonioItemDesc_Observacao.value+chr(13);
  if DMOSPatrimonio.QOSPatrimonioItemDesc_Complemento1.value <> '' then
     texto:=Texto+DMOSPatrimonio.QOSPatrimonioItemDesc_Complemento1.value+chr(13);
  if DMOSPatrimonio.QOSPatrimonioItemDesc_Complemento2.value <> '' then
    texto:=Texto+DMOSPatrimonio.QOSPatrimonioItemDesc_Complemento2.value+chr(13);
  if texto <> '' then
    showmessage(texto);
end;

procedure TFOSPatrimonio.ImpressoFormulrio1Click(Sender: TObject);
begin
  inherited;
  with DMOSPatrimonio do
  begin
    if QOSPatrimonioNum_OS_CAB.text <> '' then
    begin
      If FRFormularioOS= Nil then
        FRFormularioOS := TFRFormularioOS.Create(Application);
      QRFormularioOS.Close;
      QRFormularioOS.SetVariable('Num_OS_Cab',QOSPatrimonioNum_OS_Cab.value);
      QRFormularioOS.open;
      FRFormularioOS.QRPrimario.Preview;
      QRFormularioOS.Close;
    end
    else
      showmessage('É necessario Carregar uma Ordem de Serviço em Aberto');
  end;
end;

procedure TFOSPatrimonio.OScomDataPrevistapHoje1Click(Sender: TObject);
begin
  inherited;
  with DMOSPatrimonio do
  begin
    if FOSdoDia = nil then
      FOSdoDia := TFOSdoDia.Create(Application);
    QOSdoDia.Close;
    QOSdoDia.setvariable('DT_Prevista',Date);
    QOSdoDia.open;
    if FOSdoDia.showmodal = mrok then
      QOSPatrimonio.close;
      QOSPatrimonio.setvariable('PK',QOSdoDiaNum_OS_Cab.value);
      QOSPatrimonio.open;
  end;
end;

end.
