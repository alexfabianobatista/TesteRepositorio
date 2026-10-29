unit UControleViagemCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList, DBPanel;

type
  TFControleViagemCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEDataSaida: TDBEdit;
    DBEDataChegada: TDBEdit;
    DBEDestino: TDBEdit;
    DBEPrimUltima: TDBEdit;
    RelViagem1: TMenuItem;
    Label9: TLabel;
    Label26: TLabel;
    DBEKmSaida: TDBEdit;
    DBEKmChegada: TDBEdit;
    TabSheet2: TTabSheet;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label27: TLabel;
    DBEdit28: TDBEdit;
    TabSheet3: TTabSheet;
    Label28: TLabel;
    DBEdit29: TDBEdit;
    Label30: TLabel;
    DBEdit34: TDBEdit;
    DBEdit30: TDBEdit;
    Label31: TLabel;
    DBEdit35: TDBEdit;
    Label32: TLabel;
    DBEdit31: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit32: TDBEdit;
    Label29: TLabel;
    DBEdit33: TDBEdit;
    DBEdit24: TDBEdit;
    Label24: TLabel;
    DBEMedia: TDBEdit;
    Label37: TLabel;
    DBPVeiculo: TDBPanel;
    DBPMotorista: TDBPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label38: TLabel;
    DBEdit4: TDBEdit;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEKMTotal: TDBEdit;
    Label19: TLabel;
    Label21: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    DBEdit37: TDBEdit;
    Label36: TLabel;
    Label35: TLabel;
    DBEdit36: TDBEdit;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEQtCombustivel: TDBEdit;
    Label8: TLabel;
    Label25: TLabel;
    DBEValorFrete: TDBEdit;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    Label42: TLabel;
    DBEAdiantamento: TDBEdit;
    Label43: TLabel;
    DBEdit8: TDBEdit;
    DBPFilial: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure DBEKmSaidaExit(Sender: TObject);
    procedure DBPMotoristaDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBEQtCombustivelExit(Sender: TObject);
    procedure RelViagem1Click(Sender: TObject);
    procedure DBPFilialDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPVeiculoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleViagemCad: TFControleViagemCad;

implementation

uses UConhecimento_cl, UCadastro_cl, UVeiculoConhecimento_cl, UVeiculoConhecimentoCons,
  UCadastroCons, URConhecimentoContrato, URControleViagem,
  UControleViagemCons, UFilialCons, UControleViagemParam, UVeiculoCons,
  UConhecimentoParam, URControleViagemCustos, UParamSistema_cl;

{$R *.dfm}

procedure TFControleViagemCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMConhecimento.QControleViagemCab.open;
end;

procedure TFControleViagemCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FControleViagemCons = nil then
     FControleViagemCons:= TFControleViagemCons.Create(Application);
  if FControleViagemCons.ShowModal = mrOk then
  begin
    with DMConhecimento do
    begin
      QControleViagemCab.Close;
      QControleViagemCab.SetVariable('PK',QControleViagemConsCod_Controle_viagem_cab.Value);
      QControleViagemCab.Open;
    end;
  end;
end;

procedure TFControleViagemCad.DBEKmSaidaExit(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if (QControleViagemCabQT_KM_SAIDA.Value > 0) and (QControleViagemCabQT_KM_CHEGADA.Value > 0) then
      QControleViagemCabVL_TOTAL_KM.Value := QControleViagemCabQT_KM_CHEGADA.Value - QControleViagemCabQT_KM_SAIDA.Value;
  end;
end;

procedure TFControleViagemCad.DBPMotoristaDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFControleViagemCad.DBEQtCombustivelExit(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    if (QControleViagemCabVL_TOTAL_KM.Value > 0) and
       (QControleViagemCabQT_COMBUSTIVEL.Value > 0) then
      QControleViagemCabVL_MEDIA.Value := QControleViagemCabVL_TOTAL_KM.Value / QControleViagemCabQT_COMBUSTIVEL.Value;
  end;
end;

procedure TFControleViagemCad.RelViagem1Click(Sender: TObject);
begin
  inherited;
  if FControleViagemParam = nil then
    FControleViagemParam := TFControleViagemParam.Create(Application);
  FControleViagemParam.PGRelatorio.Pages[0].TabVisible := True;
  if FControleViagemParam.ShowModal = mrOk then
  begin
    with DMConhecimento do
    begin
      QRControleViagemCustos.Close;
      if FControleViagemParam.Me0Filial.Text = '' then
        QRControleViagemCustos.SetVariable('COD_FILIAL',NULL)
      else
        QRControleViagemCustos.SetVariable('COD_FILIAL',FControleViagemParam.Me0Filial.Text);

      if FControleViagemParam.Me0Motorista.Text = '' then
        QRControleViagemCustos.SetVariable('COD_MOTORISTA',NULL)
      else
        QRControleViagemCustos.SetVariable('COD_MOTORISTA',FControleViagemParam.Me0Motorista.Text);

      if FControleViagemParam.Me0Veiculo.Text = '' then
        QRControleViagemCustos.SetVariable('DESC_PLACA',NULL)
      else
        QRControleViagemCustos.SetVariable('DESC_PLACA',FControleViagemParam.Me0Veiculo.Text);

      if FControleViagemParam.ED0Destino.Text = '' then
        QRControleViagemCustos.SetVariable('DESTINO',NULL)
      else
        QRControleViagem.SetVariable('DESTINO',FControleViagemParam.ED0Destino.Text);

      QRControleViagemCustos.SQL.Strings[QRControleViagemCustos.SQL.Count - 1] := '';
      case FControleViagemParam.RG0Ordem.ItemIndex of
        0: QRControleViagemCustos.SQL.Add('ORDER BY COD_CONTROLE_VIAGEM_CAB');
        1: QRControleViagemCustos.SQL.Add('ORDER BY DT_SAIDA');
        2: QRControleViagemCustos.SQL.Add('ORDER BY DESC_DESTINO');
      end;

      if (Trim(FControleViagemParam.Me0DtInicial.Text) <> '') and
          (Trim(FControleViagemParam.Me0DtFinal.Text) <> '') then
      begin
        QRControleViagemCustos.SetVariable(':DT_INICIAL', StrToDate(FControleViagemParam.Me0DtInicial.Text));
        QRControleViagemCustos.SetVariable(':DT_FINAL', StrToDate(FControleViagemParam.Me0DtFinal.Text));
      end
      else
        Raise Exception.Create('É necessário informar uma data de viagem.');
      QRControleViagemCustos.Open;

      if FRControleViagemCustos = nil then
        FRControleViagemCustos := TFRControleViagemCustos.Create(Application);

        FRControleViagemCustos.QRLEmpresa.Caption := 'Empresa: ' + DMParamSistema.QParamSistemaCOD_EMPRESA.Text;
        FRControleViagemCustos.QRLFilialRel.Caption := 'Filial: ' + FControleViagemParam.Ed0Filial.Text;
        FRControleViagemCustos.QRLDataRel.Caption := 'Período: ' + FControleViagemParam.Me0DtInicial.Text + ' até ' + FControleViagemParam.Me0DtFinal.Text + '.';

      if FControleViagemParam.RGPreview.ItemIndex = 0 then
        FRControleViagemCustos.QRPrimario.Preview
      else
        FRControleViagemCustos.QRPrimario.Print;
    end;
  end;
end;

procedure TFControleViagemCad.DBPFilialDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFControleViagemCad.DBPVeiculoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVeiculoConhecimentoCons;
  Classe := TFVeiculoConhecimentoCons;
end;

procedure TFControleViagemCad.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

end.
