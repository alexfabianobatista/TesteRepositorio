unit UFPneuCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBCtrls, UVeiculo_cl, DBPanel, Grids, DBGrids;

type
  TFPneuCad = class(TFTCadSimples)
    RelatriodePneus1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBPMarca: TDBPanel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBPVeiculoPneuTroca: TDBPanel;
    DBGPneuTroca: TDBGrid;
    DBSNPneuTroca: TDBNavigator;
    DBPDataPneuTroca: TDBPanel;
    DBREstadoPneuTroca: TDBRadioGroup;
    Trocas1: TMenuItem;
    DBPFilial: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelatriodePneus1Click(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure MEPlacaExit(Sender: TObject);
    procedure DBPMarcaDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPVeiculoPneuTrocaDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure Trocas1Click(Sender: TObject);
    procedure DBPFilialDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPneuCad: TFPneuCad;

implementation

uses UPneu_cl, UFPneuCons, UFRPneu, UcontroleVeiculoParam, UVeiculoCons,
  UVeiculoCad, UOracle_cl, UMarcaPneuCons, UFilialCons, UBiblioteca, URTrocaPneu;

{$R *.dfm}

procedure TFPneuCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPneu.QPneuCad.Open;
end;

procedure TFPneuCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMPneu.QPneuCad.Close;
  DMPneu.QPneuTroca.Close;
end;

procedure TFPneuCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FPneuCons = nil then
    FPneuCons := TFPneuCons.Create(Application);
  if FPneuCons.ShowModal = MrOK then
  begin
    with DMPneu do
    begin
      QPneuCad.Close;
      QPneuCad.SetVariable('PK', QPneuConsCOD_PNEU.Value);
      QPneuCad.Open;
    end;
  end;
end;

procedure TFPneuCad.RelatriodePneus1Click(Sender: TObject);
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[9].Visible := True;
  if FControleVeiculoParam.ShowModal = MrOK then
  begin
    with DMPneu do
    begin
      QRPneu.Close;
      if Trim(FControleVeiculoParam.Fm9Datas.MeDtInicial.Text) = '' then
        Raise Exception.Create('A data Inicial deve ser informada')
      else
        QRPneu.SetVariable('DT_COMPRA_I', Trim(FControleVeiculoParam.Fm9Datas.MeDtInicial.Text));
      if Trim(FControleVeiculoParam.Fm9Datas.MeDtFinal.Text) = '' then
        Raise Exception.Create('A data Final deve ser informada')
      else
        QRPneu.SetVariable('DT_COMPRA_F', Trim(FControleVeiculoParam.Fm9Datas.MeDtFinal.Text));
       case FControleVeiculoParam.RG9Situacao.ItemIndex of
        0 : QRPneu.SetVariable('IND_SITUACAO', 'ATIVO');
        1 : QRPneu.SetVariable('IND_SITUACAO', 'DESATIVADO');
        2 : QRPneu.SetVariable('IND_SITUACAO', Null);
       end;
       if Trim(FControleVeiculoParam.EDPlaca.Text) <> '' then
         QRPneu.SetVariable('PLACA', FControleVeiculoParam.EDPlaca.Text)
       else
         QRPneu.SetVariable('PLACA', Null);
       QRPneu.Open;

       if FRPneu = nil then
        FRPneu := TFRPneu.Create(Application);
       FRPneu.QRLTitulo.Caption := 'Relatório de Pneu';

       if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
        FRPneu.QRPrimario.Preview
       else
        FRPneu.QRPrimario.Print;

        FRPneu.Close;
    end;
  end;
end;

procedure TFPneuCad.SBVeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);


  FVeiculoCons.Close;
end;

procedure TFPneuCad.MEPlacaExit(Sender: TObject);
begin
  inherited;
{
  if Trim(MePlaca.Text) <> '' then
  begin
    with DMVeiculo do
    begin
      QVeiculoCons.close;
      QVeiculoCons.SetVariable('NUM_PLACA',Trim(MePlaca.Text));
      QVeiculoCons.Open;
      if QVeiculoCons.RecordCount > 0 then
      begin
        EdModelo.Text := QVeiculoConsDESC_MODELO.Text;
      end
      else
      begin
        if (MessageDlg('Veículo não cadastrado. Deseja cadastrar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          if FVeicCad = Nil then
            FVeicCad := TFVeicCad.Create(Application);
          FVeicCad.SBConsulta.Enabled := false;
          DMOracle.DBCemapa.Rollback;//Necessário em caso de abrir a tela de cad. veiculo e fechar sem realizar o cadastro. (Pau de DataSet). Junior 22/05/2017.
          FVeicCad.ShowModal;
        end
        else
          EdModelo.Clear;
      end;
    end;
  end;  }
end;

procedure TFPneuCad.DBPMarcaDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMarcaPneuCons;
  Classe := TFMarcaPneuCons;
end;

procedure TFPneuCad.DBPVeiculoPneuTrocaDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVeiculoCons;
  Classe := TFVeiculoCons;
end;

procedure TFPneuCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  DBSNPneuTroca.Enabled := DSPrimario.State in [dsInsert, dsEdit];
end;

procedure TFPneuCad.Trocas1Click(Sender: TObject);
var
  setVar : TBib;
  wSituacao : String;
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[11].Visible := True;

  if FControleVeiculoParam.ShowModal = MrOK then
  begin
    case FControleVeiculoParam.RG12Situacao.ItemIndex of
      0: wSituacao := '';
      1: wSituacao := 'ATIVO';
      2: wSituacao := 'DESATIVADO';
      3: wSituacao := 'DESCARTADO';
      else wSituacao := '';
    end;

    DMPneu.QRTroca.Close;
    setVar := TBib.Create();
    setVar.setVariableOuNull(DMPneu.QRTroca,'FILIAL', Trim(FControleVeiculoParam.Me12Filial.Text));
    setVar.setVariableOuNull(DMPneu.QRTroca,'PNEU', Trim(FControleVeiculoParam.Me12Pneu.Text));
    setVar.setVariableOuNull(DMPneu.QRTroca,'SITUACAO', wSituacao);
    setVar.setVariableOuNull(DMPneu.QRTroca,'DT_COMPRA_I', Trim(FControleVeiculoParam.Me12CompraInicial.Text));
    setVar.setVariableOuNull(DMPneu.QRTroca,'DT_COMPRA_F', Trim(FControleVeiculoParam.Me12CompraFinal.Text));
    setVar.setVariableOuNull(DMPneu.QRTroca,'DT_TROCA_I', Trim(FControleVeiculoParam.Me12TrocaInicial.Text));
    setVar.setVariableOuNull(DMPneu.QRTroca,'DT_TROCA_F', Trim(FControleVeiculoParam.Me12TrocaFinal.Text));
    DMPneu.QRTroca.Open;

  if FRTrocaPneu = nil then
    FRTrocaPneu := TFRTrocaPneu.Create(Application);
  if Trim(FControleVeiculoParam.Me12Filial.Text) <> '' then
    FRTrocaPneu.QRLEmpresa.Caption := 'Filial: ' + DMOracle.FastSelect('DESC_FILIAL','TB_FILIAL','COD_FILIAL = ' + Trim(FControleVeiculoParam.Me12Filial.Text))
  else
    FRTrocaPneu.QRLEmpresa.Caption := 'Filial: Todas';
  if Trim(FControleVeiculoParam.Me12Pneu.Text) <> '' then
    FRTrocaPneu.QRLPneu.Caption := 'Pneu:' + DMOracle.FastSelect('DESC_DESCRICAO','TB_PNEU','COD_PNEU = ' + Trim(FControleVeiculoParam.Me12Pneu.Text))
  else
    FRTrocaPneu.QRLPneu.Caption := 'Pneu: Todos';
  if (Trim(FControleVeiculoParam.Me12TrocaInicial.Text) <> '') and
    (Trim(FControleVeiculoParam.Me12TrocaFinal.Text) <> '') then
    FRTrocaPneu.QRLData.Caption := 'Dt.Troca: Desde ' + Trim(FControleVeiculoParam.Me12TrocaInicial.Text) + ' até ' + Trim(FControleVeiculoParam.Me12TrocaFinal.Text)
  else
    FRTrocaPneu.QRLData.Caption := '';
  FRTrocaPneu.QRLTitulo.Caption := 'Relatório de Trocas de Pneu';
  case FControleVeiculoParam.RG12Situacao.ItemIndex of
    0: FRTrocaPneu.QRLSituacao.Caption :='Situação: Qualquer';
    1: FRTrocaPneu.QRLSituacao.Caption :='Situação: Ativados';
    2: FRTrocaPneu.QRLSituacao.Caption := 'Situação: Desativados';
    3: FRTrocaPneu.QRLSituacao.Caption := 'Situação: Descartados';
  end;

   if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
      FRTrocaPneu.QRPrimario.Preview
   else
      FRTrocaPneu.QRPrimario.Print;
  end;
end;

procedure TFPneuCad.DBPFilialDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

end.
