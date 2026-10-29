unit UFCustosCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, UTCADSIMPLES, DBDirceu, variants;

type
  TFCustoCad = class(TFTCadSimples)
    Panel2: TPanel;
    Panel3: TPanel;
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
    SB_DepartamentoCons: TSpeedButton;
    SB_HistoricoCons: TSpeedButton;
    SB_FilialCons: TSpeedButton;
    ConferenciaLancamentos: TMenuItem;
    CustosporDepartamento2: TMenuItem;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    ApuraodeResultado1: TMenuItem;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure SB_FilialConsClick(Sender: TObject);
    procedure SB_DepartamentoConsClick(Sender: TObject);
    procedure SB_HistoricoConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ConferenciaLancamentosClick(Sender: TObject);
    procedure CustosporDepartamento2Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApuraodeResultado1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCustoCad: TFCustoCad;

implementation

uses UDMCustos, UOracle_cl, UFilialCons, UFilial_cl, UDepartamentoCons,
  UDepartamento_cl,UFCustoCons,UFCustosParam, URCustos_Departamento,
  URCustos_Historico, UFRCustosLancamentos, URApuracaoResultado,
  UPlanoContaCons, UPlanoConta_cl, UUsuario_cl;

{$R *.DFM}

procedure TFCustoCad.SB_FilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
    DMCustos.QCustoCadCod_Filial.Value := DMFilial.QFilialConsCOD_FILIAL.Value;

end;

procedure TFCustoCad.SB_DepartamentoConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
     FDepartamentoCons := TFDepartamentoCons.Create(Application);

  if FDepartamentoCons.ShowModal = mrOk then
    DMCustos.QCustoCadCod_Departamento.Value := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;

end;

procedure TFCustoCad.SB_HistoricoConsClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
     FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMCustos.QCustoCadCod_Plano_Conta.Value := DMPlanoConta.QPlanoContaConsCOD_PLANO_CONTA.Value;
end;

procedure TFCustoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FCustoscons = nil then
     FCustosCons := TFCustosCons.Create(Application);

  if FCustosCons.ShowModal = mrOk then
  begin
    with DMCustos do
    begin
      QCustoCad.Close;
      QCustoCad.SetVariable('PK',QCustoConsCOD_CUSTO.Value);
      QCustoCad.Open;
    end;
  end;
end;

procedure TFCustoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMCustos do
  begin
    QCustoCad.Close;
    QCustoCad.CommitOnPost := True;
    QCustoCad.Open;
  end;
end;

procedure TFCustoCad.ConferenciaLancamentosClick(Sender: TObject);
begin
  inherited;
  if FCustosParam = nil then
     FCustosParam := TFCustosParam.Create(Application);
  FCustosParam.PGRelatorio.Pages[1].TabVisible := True;

  if FCustosParam.ShowModal = mrOk then
  begin
  DmUsuario.Checar_Filial_Usuario(FCustosParam.ME1_CodFilial.Text,'CUSTOS');
    with DMCustos do
    begin
      if (Trim(FCustosParam.ME1_DataI.Text) = '') OR (Trim(FCustosParam.ME1_DataF.Text) = '') then
      begin
        FCustosParam.ME1_DataI.SetFocus;
        raise exception.Create('Periodo - Data Inicio/Final não podem ficar em branco!')
      end;
      QRCustosRel.Close;
      if Trim(FCustosParam.ME1_CodFilial.Text) = '' then
         QRCustosRel.SetVariable('COD_FILIAL',Null)
      else
         QRCustosRel.SetVariable('COD_FILIAL',FCustosParam.ME1_CodFilial.Text);

      if Trim(FCustosParam.ME1_CodDepartamento.Text) = '' then
         QRCustosRel.SetVariable('COD_DEPARTAMENTO',Null)
      else
         QRCustosRel.SetVariable('COD_DEPARTAMENTO',FCustosParam.ME1_CodDepartamento.Text);

      if Trim(FCustosParam.ME1_CodPlano.Text) = '' then
         QRCustosRel.SetVariable('COD_PLANO_CONTA',Null)
      else
         QRCustosRel.SetVariable('COD_PLANO_CONTA',FCustosParam.ME1_CodPlano.Text);

      QRCustosRel.SetVariable('DATA_I',FCustosParam.ME1_DataI.Text);
      QRCustosRel.SetVariable('DATA_F',FCustosParam.ME1_DataF.Text);

      QRCustosRel.Open;

      if FRCustosLancamentos = nil then
         FRCustosLancamentos := TFRCustosLancamentos.Create(Application);

      if FCustosParam.RGPreview.ItemIndex = 0 then
         FRCustosLancamentos.QRPrimario.Preview
      else
         FRCustosLancamentos.QRPrimario.Print;

      QRCustosRel.Close;
    end;
  end;
end;

procedure TFCustoCad.CustosporDepartamento2Click(Sender: TObject);
begin
  inherited;
  if FCustosParam = nil then
     FCustosParam := TFCustosParam.Create(Application);

  FCustosParam.PGRelatorio.Pages[2].TabVisible := True;

  if FCustosParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FCustosParam.ME2_CodFilial.Text,'CUSTOS');  
    with DMCustos do
    begin
      if (Trim(FCustosParam.ME2_DataI.Text) = '') OR (Trim(FCustosParam.ME2_DataF.Text) = '') then
      begin
        FCustosParam.ME2_DataI.SetFocus;
        raise exception.Create('Periodo - Data Inicio/Final não podem ficar em branco!')
      end;

      QRCustoDepartamento.Close;

      if Trim(FCustosParam.ME2_CodFilial.Text) = '' then
         QRCustoDepartamento.SetVariable('COD_FILIAL',Null)
      else
         QRCustoDepartamento.SetVariable('COD_FILIAL',FCustosParam.ME2_CodFilial.Text);

      if Trim(FCustosParam.ME2_CodDepartamento.Text) = '' then
         QRCustoDepartamento.SetVariable('COD_DEPARTAMENTO',Null)
      else
         QRCustoDepartamento.SetVariable('COD_DEPARTAMENTO',FCustosParam.ME2_CodDepartamento.Text);

      if Trim(FCustosParam.ME2_CodPlano.Text) = '' then
         QRCustoDepartamento.SetVariable('COD_PLANO_CONTA',Null)
      else
         QRCustoDepartamento.SetVariable('COD_PLANO_CONTA',FCustosParam.ME2_CodPlano.Text);
      QRCustoDepartamento.SetVariable('DATA_I',FCustosParam.ME2_DataI.Text);
      QRCustoDepartamento.SetVariable('DATA_F',FCustosParam.ME2_DataF.Text);

      QRCustoDepartamento.Open;

      if FRCustoDepartamento = nil then
         FRCustoDepartamento := TFRCustoDepartamento.Create(Application);

      if FCustosParam.RGPreview.ItemIndex = 0 then
         FRCustoDepartamento.QRPrimario.Preview
      else
         FRCustoDepartamento.QRPrimario.Print;

      QRCustoDepartamento.Close;

    end;
  end;

end;

procedure TFCustoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(5);
end;

procedure TFCustoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with DMCustos do
  begin
    QCustoCad.Close;
  End;
end;

procedure TFCustoCad.ApuraodeResultado1Click(Sender: TObject);
begin
  inherited;
  if FCustosParam = nil then
     FCustosParam := TFCustosParam.Create(Application);
  FCustosParam.PGRelatorio.Pages[3].TabVisible := True;

  if FCustosParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FCustosParam.ME3_CodFilial.Text,'CUSTOS');
    if (Trim(FCustosParam.ME3_DataI.Text) = '') or
       (Trim(FCustosParam.ME3_DataF.Text) = '') then
       raise exception.Create('Data inicio/final devem ser informadas!');

    with DMCustos do
    begin
      if Trim(FCustosParam.ME3_CodFilial.Text) = '' then
         QRApuracaoResultado.SetVariable('COD_FILIAL',Null)
      else
         QRApuracaoResultado.SetVariable('COD_FILIAL',FCustosParam.ME3_CodFilial.Text);

      if Trim(FCustosParam.ME3_CodDepartamento.Text) = '' then
         QRApuracaoResultado.SetVariable('COD_DEPARTAMENTO',Null)
      else
         QRApuracaoResultado.SetVariable('COD_DEPARTAMENTO',FCustosParam.ME3_CodDepartamento.Text);

      QRApuracaoResultado.SetVariable('DATA_I',StrToDate(FCustosParam.ME3_DataI.Text));
      QRApuracaoResultado.SetVariable('DATA_F',StrToDate(FCustosParam.ME3_DataF.Text));

      QRApuracaoResultado.Open;
      if FRApuracaoResultado = nil then
         FRApuracaoResultado := TFRApuracaoResultado.Create(Application);

      if FCustosParam.ME3_CodFilial.Text <> '' then
         FRApuracaoResultado.QRLEmpresa.Caption := 'Filial:' + FCustosParam.Ed3_DescFilial.Text
      else
         FRApuracaoResultado.QRLEmpresa.Caption := 'Filial: Todas';

      if FCustosParam.ME3_CodDepartamento.Text <> '' then
         FRApuracaoResultado.QRLEmpresa.Caption := FRApuracaoResultado.QRLEmpresa.Caption + ' Depto: ' + FCustosParam.Ed3_DescDepartamento.Text
      else
         FRApuracaoResultado.QRLEmpresa.Caption := FRApuracaoResultado.QRLEmpresa.Caption + ' Depto: Todos';

      FRApuracaoResultado.QRLPeriodo.Caption:= FCustosParam.ME3_DataI.Text+' A '+FCustosParam.ME3_DataF.Text;

      if FCustosParam.RGPreview.ItemIndex = 0 then
         FRApuracaoResultado.QRPrimario.Preview
      else
         FRApuracaoResultado.QRPrimario.Print;
      QRApuracaoResultado.Close;
    end;
  end;
end;

procedure TFCustoCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TFCustoCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario(DMCustos.QCustoCadCOD_FILIAL.Text,'CUSTOS');
  inherited;
end;

end.

