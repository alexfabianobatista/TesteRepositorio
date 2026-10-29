unit UFRateioCustoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls, DBDirceu, variants;

type
  TFRateioCustoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEFilialOrigem: TDBEdit;
    Label3: TLabel;
    DBECodDepartamentoOrigem: TDBEdit;
    Label5: TLabel;
    DBEFilialDestino: TDBEdit;
    Label6: TLabel;
    DBEDepartamentoDestino: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    SB_FilialOCons: TSpeedButton;
    SB_DptoOCons: TSpeedButton;
    SBHistoricoCons: TSpeedButton;
    SB_FilialDCons: TSpeedButton;
    SB_DptoDCons: TSpeedButton;
    Rateiodocustos1: TMenuItem;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBDirceu1: TDBDirceu;
    procedure SB_DptoOConsClick(Sender: TObject);
    procedure SB_DptoDConsClick(Sender: TObject);
    procedure SB_FilialOConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SB_FilialDConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Rateiodocustos1Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SBHistoricoConsClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRateioCustoCad: TFRateioCustoCad;

implementation

uses UDMCustos, UOracle_cl, UDepartamentoCons, UDepartamento_cl,
  UFilial_cl, UFilialCons, UFRateioCustoCons,
  UFCustosParam, UFRRateioCustos, UPlanoContaCons, UPlanoConta_cl,
  UUsuario_cl;

{$R *.DFM}

procedure TFRateioCustoCad.SB_DptoOConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
     FDepartamentoCons := TFDepartamentoCons.Create(Application);

  if FDepartamentoCons.ShowModal = mrOk then
    DMCustos.QRateioCustosCadCod_Dpto_Orig.Value := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
end;

procedure TFRateioCustoCad.SB_DptoDConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
     FDepartamentoCons := TFDepartamentoCons.Create(Application);

  if FDepartamentoCons.ShowModal = mrOk then
  begin
    DMCustos.QRateioCustosCadCod_Dpto_Dest.Value := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Value;
  end;
end;

procedure TFRateioCustoCad.SB_FilialOConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
    DMCustos.QRateioCustosCadCod_Filial_Orig.Value := DMFilial.QFilialConsCOD_FILIAL.Value
end;

procedure TFRateioCustoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMCustos do
  begin
    QRateioCustosCad.Close;
    QRateioCustosCad.Open;
  end;
end;

procedure TFRateioCustoCad.SB_FilialDConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);

  if FFilialCons.ShowModal = mrOk then
    DMCustos.QRateioCustosCadCod_Filial_Dest.Value := DMFilial.QFilialConsCOD_FILIAL.Value;
end;

procedure TFRateioCustoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FRateio_CustoCons = nil then
     FRateio_CustoCons := TFRateio_CustoCons.Create(Application);
  if FRateio_CustoCons.ShowModal = mrOk then
  begin
    with DMCustos do
    begin
      QRateioCustosCad.Close;
      QRateioCustosCad.SetVariable('PK',QRateio_CustosConsCOD_RATEIO_CUSTOS.Value);
      QRateioCustosCad.Open;
    end;
  end;
end;

procedure TFRateioCustoCad.Rateiodocustos1Click(Sender: TObject);
begin
  inherited;
  if FCustosParam = nil then
     FCustosParam := TFCustosParam.Create(Application);

  FCustosParam.PGRelatorio.Pages[0].TabVisible := True;

  if FCustosParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FCustosParam.ME_FilialOrigem.Text),'CUSTOS');
    DmUsuario.Checar_Filial_Usuario( Trim(FCustosParam.ME_FilialDestino.Text),'CUSTOS');
    with DMCustos do
    begin
      QRRateioCusto.Close;

      if Trim(FCustosParam.ME_FilialOrigem.Text) = '' then
         QRRateioCusto.SetVariable('COD_FILIAL_ORIG',Null)
      else
         QRRateioCusto.SetVariable('COD_FILIAL_ORIG',FCustosParam.ME_FilialOrigem.Text);

      if Trim(FCustosParam.ME_DptoOrigem.Text) = '' then
         QRRateioCusto.SetVariable('COD_DPTO_ORIG',Null)
      else
         QRRateioCusto.SetVariable('COD_DPTO_ORIG',FCustosParam.ME_DptoOrigem.Text);

      if Trim(FCustosParam.ME_CodPlanoConta.Text) = '' then
         QRRateioCusto.SetVariable('COD_PLANO_CONTA',Null)
      else
         QRRateioCusto.SetVariable('COD_PLANO_CONTA',FCustosParam.ME_CodPlanoConta.Text);

      if Trim(FCustosParam.ME_FilialDestino.Text) = '' then
         QRRateioCusto.SetVariable('COD_FILIAL_DEST',Null)
      else
         QRRateioCusto.SetVariable('COD_FILIAL_DEST',FCustosParam.ME_FilialDestino.Text);

      QRRateioCusto.Open;

      if QRRateioCusto.RecordCount = 0 then
         raise exception.Create('Nenhuma informção para imprimir!');

      if FRRateioCustos = nil then
         FRRateioCustos := TFRRateioCustos.Create(Application);

      if FCustosParam.RGPreview.ItemIndex = 0 then
         FRRateioCustos.QRPrimario.Preview
      else
         FRRateioCustos.QRPrimario.Print;
      QRRateioCusto.Close;
    end;
  end;
end;

procedure TFRateioCustoCad.DBEdit7Exit(Sender: TObject);
var mPercentual : Real;
begin
  inherited;
  with DMCustos do
  begin
    QRateio_CustosCons.Close;
    if (QRateioCustosCadCod_Filial_Orig.Text <> '') And
       (QRateioCustosCadCod_Plano_Conta.Text <> '') then
    begin
      QRateio_CustosCons.SetVariable('COD_FILIAL_ORIG',QRateioCustosCadCod_Filial_Orig.Text);
      QRateio_CustosCons.SetVariable('COD_DPTO_ORIG',Null);
      QRateio_CustosCons.SetVariable('COD_PLANO_CONTA',QRateioCustosCadCod_Plano_Conta.Text);
      QRateio_CustosCons.Open;
      if QRateio_CustosCons.RecordCount > 0 then
      begin
        QRateio_CustosCons.First;
        mPercentual := 0;
        while not QRateio_CustosCons.Eof do
        begin
          mPercentual := mPercentual + QRateio_CustosConsPERC_RATEIO.Value;
          QRateio_CustosCons.Next;
        end;
        QRateio_CustosCons.Close;
        if mPercentual > 100 then
        begin
          MessageDlg('Percentual de rateio para o PLANO CONTA/FILIAL ultrapassa os 100%!',mtWarning,[mbOk],0);
          DBEdit7.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TFRateioCustoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(2);
end;

procedure TFRateioCustoCad.SBHistoricoConsClick(Sender: TObject);
begin
  inherited;
  if FPlanoContaCons = nil then
     FPlanoContaCons := TFPlanoContaCons.Create(Application);
  if FPlanoContaCons.ShowModal = mrOk then
    DMCustos.QRateioCustosCadCOD_PLANO_CONTA.Value := DMPlanoConta.QPlanoContaConsCOD_PLANO_CONTA.Value;

end;

procedure TFRateioCustoCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMCustos.QRateioCustosCadCOD_FILIAL_ORIG.Text),'CUSTOS');
  DmUsuario.Checar_Filial_Usuario( Trim(DMCustos.QRateioCustosCadCOD_FILIAL_DEST.Text),'CUSTOS');
  inherited;
end;

end.
