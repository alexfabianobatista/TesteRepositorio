unit UDespesaRecupCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, variants, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, DBPanel;

type
  TFDespesaRecupCad = class(TFTCadSimples)
    SBMedia: TSpeedButton;
    Recibo1: TMenuItem;
    RelDespesaRecuperada1: TMenuItem;
    PageControl1: TPageControl;
    TBSRecupDespesaVeic: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LbQtdade: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SBVeiculo: TSpeedButton;
    SBProduto: TSpeedButton;
    SBCadastro: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    SBBanco: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBRGTp: TDBRadioGroup;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    TBSEspindola: TTabSheet;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label21: TLabel;
    Label23: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    GroupBox2: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit24: TDBEdit;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    DBDirceu8: TDBDirceu;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBEdit23: TDBEdit;
    Label22: TLabel;
    TBSRecebimentoEstufa: TTabSheet;
    Label24: TLabel;
    DBEdit25: TDBEdit;
    Label25: TLabel;
    DBEdit26: TDBEdit;
    Label28: TLabel;
    DBEdit27: TDBEdit;
    Label29: TLabel;
    DBEdit28: TDBEdit;
    Label30: TLabel;
    DBEdit29: TDBEdit;
    Label31: TLabel;
    DBEdit30: TDBEdit;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBDirceu7: TDBDirceu;
    DBDirceu9: TDBDirceu;
    SpeedButton6: TSpeedButton;
    DBDirceu10: TDBDirceu;
    GroupBox3: TGroupBox;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    Label32: TLabel;
    Label34: TLabel;
    Label33: TLabel;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    Label35: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure SBVeiculoClick(Sender: TObject);
    procedure SBCadastroClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SBBancoClick(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBRGTpChange(Sender: TObject);
    procedure SBMediaClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Recibo1Click(Sender: TObject);
    procedure RelDespesaRecuperada1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBIncluirClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBEdit26Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDespesaRecupCad: TFDespesaRecupCad;

implementation

uses UDespesaRecup_cl, UProdutoCons, UProduto_cl, UVeiculoCons, UVeiculo_cl,
  UOracle_cl, UMediaKm, UCadastroCons, UCadastro_cl, UBancosCons,
  UBancoAgencia_cl, UDespesaRecupCons, URRecibo, UBiblioteca,
  UParamSistema_cl, UControleVeiculoParam, URDespesaRecup;

{$R *.DFM}

procedure TFDespesaRecupCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMDespesaRecup.QDespesaRecupCad.open;
end;

procedure TFDespesaRecupCad.SBProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    DMDespesaRecup.QDespesaRecupCadCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.Value;
    DBEdit3Exit(Self);
  end;
end;

procedure TFDespesaRecupCad.SBVeiculoClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
    DMDespesaRecup.QDespesaRecupCadCOD_VEICULO.Value := DMVeiculo.QVeiculoConsCOD_VEICULO.Value;
end;

procedure TFDespesaRecupCad.SBCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMDespesaRecup.QDespesaRecupCadCOD_CADASTRO.Value := DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

procedure TFDespesaRecupCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert,DSEdit] then
  begin
    if Trim(DBEdit2.Text) <> '' then
      DMDespesaRecup.QDespesaRecupCadCOD_CADASTRO.Text := DMOracle.BuscaNome('SELECT COD_MOTORISTA FROM TB_VEICULO','COD_VEICULO = '+Trim(DBEdit2.Text));
  end;
  DBEdit8Exit(Self);
end;

procedure TFDespesaRecupCad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert,DSEdit] then
  begin
    if (Trim(DBEdit3.Text) <> '') and{Adicionado CodEmpresa OLIVEIRA para lançar produtos que não são do tipo veículo. Alex 09-01-2026}
       ((DMParamSistema.CodEmpresa <> 'NFCE-ROBER') and (DMParamSistema.CodEmpresa <> 'LRMARMORE') and (DMParamSistema.CodEmpresa <> 'OLIVEIRA') ) then
    begin
      if Trim(DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO',
                                 'COD_PRODUTO = '+Trim(DBEdit3.Text))) <> 'VEICULO' then
      begin
        DBEdit3.Clear;
        Raise Exception.Create('Produto Inválido - Este produto não é do Tipo Veículo');
      end;
    end;
  end;
  DBEdit8Exit(Self);
end;

procedure TFDespesaRecupCad.SBBancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk then
    DMDespesaRecup.QDespesaRecupCadCOD_BANCO.Value := DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value;
end;

procedure TFDespesaRecupCad.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert,DSEdit] then
  begin
    with DMDespesaRecup do
    begin
      if (Trim(QDespesaRecupCadCOD_VEICULO.Text) <> '') and
         (Trim(QDespesaRecupCadCOD_PRODUTO.Text) <> '') and
         (Trim(QDespesaRecupCadDT_INICIO.Text)   <> '') and
         (Trim(QDespesaRecupCadDT_FIM.Text)      <> '') then
      begin
        try
          QMedia.Close;
          QMedia.SetVariable('VEICULO',QDespesaRecupCadCOD_VEICULO.Value);
          QMedia.SetVariable('PRODUTO',QDespesaRecupCadCOD_PRODUTO.Value);
          QMedia.SetVariable('DATA_I',QDespesaRecupCadDT_INICIO.Value);
          QMedia.SetVariable('DATA_F',QDespesaRecupCadDT_FIM.Value);
          QMedia.Open;
          QDespesaRecupCadMEDIA.Text := QMediaMEDIA.Text;
          QDespesaRecupCadVL_UNITARIO.Text := QMediaVL_UNITARIO.Text;
        except
          Raise
        end;
      end;
    end;
  end;
end;

procedure TFDespesaRecupCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBMedia.Enabled := (DSPrimario.State in [DsEdit, DsInsert]); //SBConsulta.Enabled;
  SBVeiculo.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);//SBConfirmar.Enabled;
  SBProduto.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);//SBConfirmar.Enabled;
  SBCadastro.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);//SBConfirmar.Enabled;
  SBBanco.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);//SBConfirmar.Enabled;
  SpeedButton4.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  SpeedButton5.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  SpeedButton6.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
end;

procedure TFDespesaRecupCad.DBRGTpChange(Sender: TObject);
begin
  inherited;
  if DBRGTp.ItemIndex = 0 then
    LbQtdade.Caption := 'KM'
  else if DBRGTp.ItemIndex = 1 then
    LbQtdade.Caption := 'QTDADE.'
  else
    LbQtdade.Caption := 'Qtdade/Km';
end;

procedure TFDespesaRecupCad.SBMediaClick(Sender: TObject);
begin
  inherited;
  if FMediaKm = nil then
    FMediaKm := TFMediaKm.Create(Application);
  FMediaKm.ShowModal;
end;

procedure TFDespesaRecupCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FDespesaRecupCons = nil then
    FDespesaRecupCons := TFDespesaRecupCons.Create(Application);
  if FDespesaRecupCons.ShowModal = mrOk then
  begin
    DSPrimario.DataSet.Close;
    DMDespesaRecup.QDespesaRecupCad.SetVariable('PK',DMDespesaRecup.QDespesaRecupConsCOD_DESPESA_RECUP.Value);
    DSPrimario.DataSet.Open;
  end;
end;

procedure TFDespesaRecupCad.Recibo1Click(Sender: TObject);
begin
  inherited;
  with DMDespesaRecup do
  begin
    if Trim(QDespesaRecupCadCOD_DESPESA_RECUP.Text) = '' then
      Raise Exception.Create('Informe uma Despesa.');
    QRRecibo.Close;
    QRRecibo.SetVariable('COD_DESPESA_RECUP',QDespesaRecupCadCOD_DESPESA_RECUP.Value);
    QRRecibo.Open;
    if FRRecibo = nil then
      FRRecibo := TFRRecibo.Create(Application);
    FRRecibo.QRLText1.Caption := 'Recebemos de '+Trim(QRReciboNOME.Value)+', a importância de R$ '+Trim(QRRecibovlr_total.Text);
    FRRecibo.QRLText2.Caption := '('+Bib.extenso(QRRecibovlr_total.Value,'Real')+') referente a reembolso de despesa de '+Trim(QRReciboDESC_PRODUTO.Value);
    FRRecibo.QRLLocalData.Caption := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL','COD_FILIAL = '+DMParamSistema.QParamSistemaCOD_FILIAL.Text)+FormatDateTime(', dd "de" mmmm "de" yyyy"."',QRReciboDT_DESPESA.Value);
    FRRecibo.QRLEmpresa1.Caption := DMParamSistema.QParamSistemaDESC_EMPRESA.Value;
    FRRecibo.QRPrimario.Preview;
    QRRecibo.Close;
  end;
end;

procedure TFDespesaRecupCad.RelDespesaRecuperada1Click(Sender: TObject);
begin
  inherited;
  if FControleVeiculoParam = nil then
    FControleVeiculoParam := TFControleVeiculoParam.Create(Application);
  FControleVeiculoParam.PGRelatorio.Pages[4].TabVisible := True;
  if FControleVeiculoParam.ShowModal = mrOk then
  begin
    with DMDespesaRecup do
    begin
      QRDespesaRecup.Close;
      if Trim(FControleVeiculoParam.ME4Data_I.Text) = '' then
        Raise Exception.Create('Data inicial deve ser Informada');
      if Trim(FControleVeiculoParam.ME4Data_F.Text) = '' then
        FControleVeiculoParam.ME4Data_F.Text := DateToStr(Date);
      QRDespesaRecup.SetVariable('DATA_I',FControleVeiculoParam.ME4Data_I.Text);
      QRDespesaRecup.SetVariable('DATA_F',FControleVeiculoParam.ME4Data_F.Text);
      if Trim(FControleVeiculoParam.ME4Veiculo.Text) <> '' then
        QRDespesaRecup.SetVariable('VEICULO',FControleVeiculoParam.ME4Veiculo.Text)
      else
        QRDespesaRecup.SetVariable('VEICULO',NULL);
      if Trim(FControleVeiculoParam.ME4Produto.Text) <> '' then
        QRDespesaRecup.SetVariable('PRODUTO',FControleVeiculoParam.ME4Produto.Text)
      else
        QRDespesaRecup.SetVariable('PRODUTO',NULL);
      if Trim(FControleVeiculoParam.ME4Cadastro.Text) <> '' then
        QRDespesaRecup.SetVariable('CADASTRO',FControleVeiculoParam.ME4Cadastro.Text)
      else
        QRDespesaRecup.SetVariable('CADASTRO',NULL);
      if Trim(FControleVeiculoParam.CB4Classificacao.Text) <> 'TODOS' then
        QRDespesaRecup.SetVariable('CLASSIFICACAO',FControleVeiculoParam.CB4Classificacao.Text)
      else
        QRDespesaRecup.SetVariable('CLASSIFICACAO',NULL);
        
      QRDespesaRecup.Open;
      if FRDespesaRecup = nil then
        FRDespesaRecup := TFRDespesaRecup.Create(Application);
      FRDespesaRecup.QRLPeriodo.Caption := 'Período: De '+FControleVeiculoParam.ME4Data_I.Text+
                                                   ' Até '+FControleVeiculoParam.ME4Data_F.Text;
      FRDespesaRecup.QRLClassificacao.Caption := ('Classificação: '+ FControleVeiculoParam.CB4Classificacao.Text);
      if FControleVeiculoParam.RGPreview.ItemIndex = 0 then
        FRDespesaRecup.QRPrimario.Preview
      else
        FRDespesaRecup.QRPrimario.Print;
      QRDespesaRecup.Close;
    end;
  end;
end;

procedure TFDespesaRecupCad.FormCreate(Sender: TObject);
begin
  inherited;
  //garante que perde o dataset    
  if dsprimario.DataSet = nil then
    dsPrimario.DataSet := DMDespesaRecup.QDespesaRecupCad;

  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
  begin
    TBSRecupDespesaVeic.TabVisible := False;
    TBSRecebimentoEstufa.TabVisible := False;
  end
  else if (DMParamSistema.CodEmpresa = 'TOMATESMI') then
  begin
    TBSRecupDespesaVeic.TabVisible := False;
    TBSEspindola.TabVisible := False;
  end
  else
  begin
    TBSEspindola.TabVisible := False;
    TBSRecebimentoEstufa.TabVisible := False;
  end;
end;

procedure TFDespesaRecupCad.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFDespesaRecupCad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFDespesaRecupCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
    DBEdit19.SetFocus;
end;

procedure TFDespesaRecupCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    DMDespesaRecup.QDespesaRecupCadCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.Value;
  end;
end;

procedure TFDespesaRecupCad.DBEdit15Exit(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert,DSEdit] then
  begin
    if Trim(DBEdit2.Text) <> '' then
      DMDespesaRecup.QDespesaRecupCadCOD_CADASTRO.Text := DMOracle.BuscaNome('SELECT COD_MOTORISTA FROM TB_VEICULO','COD_VEICULO = '+Trim(DBEdit2.Text));
  end;
  DBEdit8Exit(Self);

end;

procedure TFDespesaRecupCad.DBEdit26Exit(Sender: TObject);
begin
  inherited;
   DMDespesaRecup.QDespesaRecupCadVL_UNITARIO.Value := StrToFloat(DMOracle.FastSelect('VAL_VAREJO','TB_PRODUTO','COD_PRODUTO = ' + DMDespesaRecup.QDespesaRecupCadCOD_PRODUTO.Text));
end;

procedure TFDespesaRecupCad.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    DMDespesaRecup.QDespesaRecupCadCOD_PRODUTO.Value := DMProduto.QProdutoConsCOD_PRODUTO.Value;
    DMDespesaRecup.QDespesaRecupCadVL_UNITARIO.Value := DMProduto.QProdutoConsVAL_VAREJO.Value;
    if DBEdit27.CanFocus then
      DBEdit27.SetFocus;
  end;
end;

end.
