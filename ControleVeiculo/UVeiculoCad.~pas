unit UVeiculoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, DBPanel;

type
  TFVeicCad = class(TFTCadSimples)
    RelVeculos1: TMenuItem;
    Opes1: TMenuItem;
    BaixaVeculo1: TMenuItem;
    Venda1: TMenuItem;
    Sinistro1: TMenuItem;
    Roubo1: TMenuItem;
    VoltarBaixa1: TMenuItem;
    PGVeiculo: TPageControl;
    TSGeral: TTabSheet;
    TSAgricola: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    SBModelo: TSpeedButton;
    Label10: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    SBCadastro: TSpeedButton;
    Label7: TLabel;
    SBFilial: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label6: TLabel;
    SBCor: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    SBMotorista: TSpeedButton;
    Label5: TLabel;
    Label19: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit15: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit9: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DBEdit5: TDBEdit;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    DBPanel7: TDBPanel;
    DBPanel1: TDBPanel;
    Label20: TLabel;
    DBEdit23: TDBEdit;
    RelDadosdeVeculos1: TMenuItem;
    TabSheet1: TTabSheet;
    DBMObservacoes: TDBMemo;
    Label21: TLabel;
    DBPLargura: TDBPanel;
    DBPComprimento: TDBPanel;
    DBPAltura: TDBPanel;
    DBPVolumeMax: TDBPanel;
    DBPPesoMax: TDBPanel;
    DBPCidade: TDBPanel;
    DBPEstado: TDBPanel;
    DBPanel2: TDBPanel;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit24: TDBEdit;
    Label24: TLabel;
    DBEdit25: TDBEdit;
    procedure SBCadastroClick(Sender: TObject);
    procedure SBModeloClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBCorClick(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure SBIncluirClick(Sender: TObject);
    procedure RelVeculos1Click(Sender: TObject);
    procedure SBMotoristaClick(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure Sinistro1Click(Sender: TObject);
    procedure Roubo1Click(Sender: TObject);
    procedure VoltarBaixa1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure RelDadosdeVeculos1Click(Sender: TObject);
    procedure DBPCidadeDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeicCad: TFVeicCad;

implementation

uses UVeiculo_cl, UVeiculoModeloCons, UVeiculoModelo_cl, UCadastroCons,
  UCadastro_cl, UFilialCons, UFilial_cl, UVeiculoCons, UCorCons, UCor_cl,
  UControleVeiculoParam, URVeiculo, UOracle_cl, UParamSistema_cl, URDadosVeiculo,
  UCidadeCons;

{$R *.DFM}

procedure TFVeicCad.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMVeiculo.QVeiculoCadCOD_CADASTRO.Value:= DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

procedure TFVeicCad.SBModeloClick(Sender: TObject);
begin
  inherited;
  if FVeiculoModeloCons = nil then
    FVeiculoModeloCons := TFVeiculoModeloCons.Create(Application);
  if FVeiculoModeloCons.ShowModal = mrOk then
    DMVeiculo.QVeiculoCadCOD_MODELO.Value := DMVeiculoModelo.QVeiculoModeloConsCOD_MODELO.Value;
end;

procedure TFVeicCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMVeiculo.QVeiculoCad.Open;
  If DMParamSistema.CodEmpresa = 'SRTERRA' Then
     Label2.Caption := 'Descrição';
  if DMParamSistema.CodEmpresa = 'DEION' then
  begin
    DBPAltura.Required := true;
    DBPLargura.Required := true;
    DBPComprimento.Required := true;
    DBPVolumeMax.Required := true;
    DBPPesoMax.Required := true;
  end;
  if (DMParamSistema.CodEmpresa <> 'ALIANCA')    and (DMParamSistema.CodEmpresa <> 'MEDSYSTEM')  and (DMParamSistema.CodEmpresa <> 'JOFER')      and
     (DMParamSistema.CodEmpresa <> 'DEBONA')     and (DMParamSistema.CodEmpresa <> 'RRPECAS')    and (DMParamSistema.CodEmpresa <> 'RSMECANICA') and
     (DMParamSistema.CodEmpresa <> 'RENATOAUTO') then
     DMVeiculo.QVeiculoCadNum_Placa.EditMask := '>lll\-9C99;1;_';//'>lll\-lC99;1;_';
//Adicionado para a Pateli, pois atendende alguns clientes com placas do Paraguai. Alex 01/07/2022 ---Adicionado RRPECAS. Alex 18/10/2023
  if (DMParamSistema.CodEmpresa = 'PATELI') or (DMParamSistema.CodEmpresa = 'FURGOESMED') then
     DMVeiculo.QVeiculoCadNum_Placa.EditMask := '>lll\-AC99;1;_';

  if (DMParamSistema.CodEmpresa = 'COMIN') then
    Label6.Caption := 'Nome da Embarcação: ';
end;

procedure TFVeicCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMVeiculo.QVeiculoCad.Close;
end;

procedure TFVeicCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBCadastro.Enabled := SBConfirmar.Enabled;
  SBModelo.Enabled := SBConfirmar.Enabled;
  SBFilial.Enabled := SBConfirmar.Enabled;
  SBCor.Enabled := SBConfirmar.Enabled;
  SBMotorista.Enabled := SBConfirmar.Enabled;
  MMCadSimples.Items[2].Enabled := SBIncluir.Enabled;
end;

procedure TFVeicCad.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons:= TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMVeiculo.QVeiculoCadCOD_FILIAL.Value:= DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFVeicCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.showModal = mrOk then
  begin
    with DMVeiculo do
    begin
      QVeiculoCad.Close;
      QVeiculoCad.SetVariable('PK',QVeiculoConsNUM_VEICULO.Value);
      QVeiculoCad.SetVariable('COD_VEICULO',NULL);
      QVeiculoCad.Open;
      while (not QVeiculoCad.Eof) and (QVeiculoCadCOD_VEICULO.Value <> QVeiculoConsCOD_VEICULO.Value) do
        QVeiculoCad.Next;
    end;
  end;
end;

procedure TFVeicCad.SBCorClick(Sender: TObject);
begin
  inherited;
  if FCorCons = nil then
    FCorCons := TFCorCons.Create(Application);
  if FCorCons.ShowModal = mrOk then
    DMVeiculo.QVeiculoCadCOD_COR.Value := DMCor.QCorConsCOD_COR.Value;
end;

procedure TFVeicCad.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  DMVeiculo.pVeiculo := DMVeiculo.QVeiculoCadNUM_VEICULO.Value;
end;

procedure TFVeicCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DMVeiculo.pVeiculo := 0;
//Adicionado para salvar a filial e o modelo automático. Solicitado por Daniel da Itatiba. Alex 22/04/2024. Cod-Suporte: 9423
  if (DMParamSistema.CodEmpresa = 'NFCE-IVO')   or (DMParamSistema.CodEmpresa = 'ITATIBA') or (DMParamSistema.CodEmpresa = 'ALFA') or
     (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
    DBEdit4.Text := '1';//Modelo
    DBEdit7.Text := '1';//Filial
  end;
//Adicionado para salvar a filial automático. Solicitado por Kelly. Alex 23/08/2023
  if (DMParamSistema.CodEmpresa = 'PATELI') or (DMParamSistema.CodEmpresa = 'ZANONI') or (DMParamSistema.CodEmpresa = 'OLIVEIRA') then
    DBEdit7.Text := '1';//Filial
end;

procedure TFVeicCad.RelVeculos1Click(Sender: TObject);
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FControleVeiculoParam.ShowModal = mrOk then
  begin
    with DMVeiculo do
    begin
      QRVeiculo.Close;

      //Frames-------------
      if Trim(FControleVeiculoParam.FmFilial1.MeFilial.Text) <> '' then
        QRVeiculo.SetVariable('FILIAL',StrToFloat(Trim(FControleVeiculoParam.FmFilial1.MeFilial.Text)))
      else
        QRVeiculo.SetVariable('FILIAL',NULL);

      if Trim(FControleVeiculoParam.FmCadastro1.MeCadastro.Text) <> '' then
        QRVeiculo.SetVariable('PROPRIETARIO',StrToFloat(Trim(FControleVeiculoParam.FmCadastro1.MeCadastro.Text)))
      else
        QRVeiculo.SetVariable('PROPRIETARIO',NULL);
      //------------------
      if Trim(FControleVeiculoParam.CB0Tipo.Text) <> 'TODOS' then
        QRVeiculo.SetVariable('TIPO',Trim(FControleVeiculoParam.CB0Tipo.Text))
      else
        QRVeiculo.SetVariable('TIPO',NULL);
      if Trim(FControleVeiculoParam.CB0Classificacao.Text) <> 'TODOS' then
        QRVeiculo.SetVariable('CLASSIFICACAO',Trim(FControleVeiculoParam.CB0Classificacao.Text))
      else
        QRVeiculo.SetVariable('CLASSIFICACAO',NULL);

      if FControleVeiculoParam.CB0Ativo.Text = 'TODOS' then
        QRVeiculo.SetVariable('IND_BAIXA',null);
      if FControleVeiculoParam.CB0Ativo.Text = 'ATIVOS' then
        QRVeiculo.SetVariable('IND_BAIXA','ATIVO');
      if FControleVeiculoParam.CB0Ativo.Text = 'BAIXADOS' then
        QRVeiculo.SetVariable('IND_BAIXA','BAIXADO');

      QRVeiculo.Open;

      if FRVeiculo = nil then
        FRVeiculo := TFRVeiculo.Create(Application);
      FRVeiculo.QRLFilial.Caption := 'Filial: '+FControleVeiculoParam.FmFilial1.EdFilial.Text;
      FRVeiculo.QRLProprietario.Caption := 'Proprietário: '+FControleVeiculoParam.FmCadastro1.EdCadastro.Text;
      if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
        FRVeiculo.QRPrimario.Preview
      else
        FRVeiculo.QRPrimario.Print;
      QRVeiculo.Close;
    end;
  end;
end;

procedure TFVeicCad.SBMotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons:= TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMVeiculo.QVeiculoCadCOD_MOTORISTA.Value:= DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

procedure TFVeicCad.Venda1Click(Sender: TObject);
begin
  inherited;
  if Trim(DMVeiculo.QVeiculoCadCOD_VEICULO.Text) = '' then
    Raise Exception.Create('Informe o Veículo que deseja Baixar');
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
  try
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_VEICULO SET IND_BAIXA = '+#39+'VENDA'+#39);
    DMOracle.QExecSQL.SQL.Add(' WHERE COD_VEICULO = '+DMVeiculo.QVeiculoCadCOD_VEICULO.Text);
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
    DMVeiculo.QVeiculoCad.RefreshRecord;
  except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TFVeicCad.Sinistro1Click(Sender: TObject);
begin
  inherited;
  if Trim(DMVeiculo.QVeiculoCadCOD_VEICULO.Text) = '' then
    Raise Exception.Create('Informe o Veículo que deseja Baixar');
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
  try
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_VEICULO SET IND_BAIXA = '+#39+'SINISTRO'+#39);
    DMOracle.QExecSQL.SQL.Add(' WHERE COD_VEICULO = '+DMVeiculo.QVeiculoCadCOD_VEICULO.Text);
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
    DMVeiculo.QVeiculoCad.RefreshRecord;
  except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TFVeicCad.Roubo1Click(Sender: TObject);
begin
  inherited;
  if Trim(DMVeiculo.QVeiculoCadCOD_VEICULO.Text) = '' then
    Raise Exception.Create('Informe o Veículo que deseja Baixar');
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
  try
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_VEICULO SET IND_BAIXA = '+#39+'ROUBO'+#39);
    DMOracle.QExecSQL.SQL.Add(' WHERE COD_VEICULO = '+DMVeiculo.QVeiculoCadCOD_VEICULO.Text);
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
    DMVeiculo.QVeiculoCad.RefreshRecord;
  except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TFVeicCad.VoltarBaixa1Click(Sender: TObject);
begin
  inherited;
  if Trim(DMVeiculo.QVeiculoCadCOD_VEICULO.Text) = '' then
    Raise Exception.Create('Informe o Veículo que deseja Voltar Baixar');
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;
  try
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_VEICULO SET IND_BAIXA = '+#39+#39);
    DMOracle.QExecSQL.SQL.Add(' WHERE COD_VEICULO = '+DMVeiculo.QVeiculoCadCOD_VEICULO.Text);
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
    DMVeiculo.QVeiculoCad.RefreshRecord;
  except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TFVeicCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(7);
end;

procedure TFVeicCad.RelDadosdeVeculos1Click(Sender: TObject);
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[10].TabVisible := True;
  if FControleVeiculoParam.ShowModal = mrOk then
  begin
    with DMVeiculo do
    begin
      QRDadosVeiculo.Close;
      if Trim(FControleVeiculoParam.Me10Filial.Text) <> '' then
        QRDadosVeiculo.SetVariable('FILIAL',Trim(FControleVeiculoParam.Me10Filial.Text))
      else
        QRDadosVeiculo.SetVariable('FILIAL',NULL);
      if Trim(FControleVeiculoParam.Me10Veiculo.Text) <> '' then
        QRDadosVeiculo.SetVariable('VEICULO',Trim(FControleVeiculoParam.Me10Veiculo.Text))
      else
        QRDadosVeiculo.SetVariable('VEICULO',NULL);
      if Trim(FControleVeiculoParam.Me10Cadastro.Text) <> '' then
        QRDadosVeiculo.SetVariable('CADASTRO',Trim(FControleVeiculoParam.Me10Cadastro.Text))
      else
        QRDadosVeiculo.SetVariable('CADASTRO',NULL);
      if Trim(FControleVeiculoParam.Cb10Tipo.Text) <> 'TODOS' then
        QRDadosVeiculo.SetVariable('TIPO',Trim(FControleVeiculoParam.Cb10Tipo.Text))
      else
        QRDadosVeiculo.SetVariable('TIPO',NULL);
      if FControleVeiculoParam.RG10Ordem.ItemIndex = 0 then
      begin
        QRDadosVeiculo.SQL[QRDadosVeiculo.SQL.Count-1]:='';  // elimina a última Linha da SQL
        QRDadosVeiculo.SQL.Add('ORDER BY V.NUM_PLACA ASC');
      end
      else
      begin
        QRDadosVeiculo.SQL[QRDadosVeiculo.SQL.Count-1]:='';  // elimina a última Linha da SQL
        QRDadosVeiculo.SQL.Add('ORDER BY V.NUM_ANO ASC');
      end;
      
      QRDadosVeiculo.Open;

      if FRDadosVeiculo = nil then
        FRDadosVeiculo := TFRDadosVeiculo.Create(Application);
        FRDadosVeiculo.QRLFilial.Caption := 'Filial: '+FControleVeiculoParam.FmFilial1.EdFilial.Text;
        FRDadosVeiculo.QRLProprietario.Caption := 'Proprietário: '+FControleVeiculoParam.FmCadastro1.EdCadastro.Text;
        FRDadosVeiculo.QRLTitulo.Caption := 'Relatório de dados de veículos';
      if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
        FRDadosVeiculo.QRPrimario.Preview
      else
        FRDadosVeiculo.QRPrimario.Print;
      QRDadosVeiculo.Close;
    end;
  end;
end;

procedure TFVeicCad.DBPCidadeDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;
end;

end.
