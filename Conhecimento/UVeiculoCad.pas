unit UVeiculoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, DBPanel;

type
  TFVeiculoCad = class(TFTCadSimples)
    RelaoVeculos1: TMenuItem;
    DBPCidade: TDBPanel;
    DBPEstado: TDBPanel;
    Label2: TLabel;
    CMBTipoRodado: TComboBox;
    DBRadioGroup3: TDBRadioGroup;
    CMBTipoCarroceria: TComboBox;
    Label3: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit16: TDBEdit;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoVeculos1Click(Sender: TObject);
    procedure SBEstadoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBPCidadeDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure MELocalizaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculoCad: TFVeiculoCad;

implementation

uses UVeiculoConhecimento_cl, UVeiculoConhecimentoCons, URVeiculo, UEstadoCons, UEstado_cl,
  UVeiculoParam, UCidadeCons,
  UOracle_cl, UCadastroCons;

{$R *.DFM}

procedure TFVeiculoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMVeiculoConhecimento.QVeiculoCad.open;
  with DMVeiculoConhecimento do
  begin
    if QVeiculoCad.RecordCount > 0 then
    begin
      CMBTipoRodado.ItemIndex := QVeiculoCadIND_TIPO_RODADO.AsInteger;
      CMBTipoCarroceria.ItemIndex := QVeiculoCadIND_TIPO_CARROCERIA.AsInteger;
    end;
  end;
end;

procedure TFVeiculoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMVeiculoConhecimento.QVeiculoCad.close;
  action :=CaFree;
  FVeiculoCad:=nil;

end;

procedure TFVeiculoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FVeiculoConhecimentoCons = nil then
     FVeiculoConhecimentoCons:= TFVeiculoConhecimentoCons.Create(Application);
  if FVeiculoConhecimentoCons.ShowModal = mrOk then
  begin
    with DMVeiculoConhecimento do
    begin
      QVeiculoCad.Close;
      QVeiculoCad.SetVariable('PK',DMVeiculoConhecimento.QVeiculoConsDesc_Placa.Text);
      QVeiculoCad.Open;
      CMBTipoRodado.ItemIndex := QVeiculoCadIND_TIPO_RODADO.AsInteger;
      CMBTipoCarroceria.ItemIndex := QVeiculoCadIND_TIPO_CARROCERIA.AsInteger;
    end;
  end;
end;

procedure TFVeiculoCad.RelaoVeculos1Click(Sender: TObject);
begin
  inherited;
  if FVeiculoParam = Nil then
    FVeiculoParam:= TFVeiculoParam.Create(Application);
  FVeiculoParam.PGRelatorio.Pages[0].TabVisible:=True;
  If FVeiculoParam.ShowModal =  mrOk then
  begin
    with DMVeiculoConhecimento do
    begin
      QRVeiculo.Close;
      If Trim(FVeiculoParam.Me0CodProprietario.Text) <> '' Then
         QRVeiculo.SetVariable('Cod_Proprietario',StrToInt(Trim(FVeiculoParam.Me0CodProprietario.Text)))
      Else
         QRVeiculo.SetVariable('Cod_Proprietario',Null);
      If Trim(FVeiculoParam.Me0CodEstado.Text) <> '' Then
         QRVeiculo.SetVariable('Cod_Estado',Trim(FVeiculoParam.Me0CodEstado.Text))
      Else
         QRVeiculo.SetVariable('Cod_Estado',Null);
      If Trim(FVeiculoParam.Me0Cnpj_Cgc.Text) <> '' Then
         QRVeiculo.SetVariable('Num_Cnpj_Cgc',Trim(FVeiculoParam.Me0Cnpj_Cgc.Text))
      Else
         QRVeiculo.SetVariable('Num_Cnpj_Cgc',Null);
      Case FVeiculoParam.Rg0TipoVeiculo.ItemIndex of
        0 : QRVeiculo.SetVariable('Desc_Tipo_Veiculo','CAVALO');
        1 : QRVeiculo.SetVariable('Desc_Tipo_Veiculo','CARRETA');
        2 : QRVeiculo.SetVariable('Desc_Tipo_Veiculo','OUTROS');
        3 : QRVeiculo.SetVariable('Desc_Tipo_Veiculo',Null);
      End;
      Case FVeiculoParam.Rg0Tipo.ItemIndex of
        0 : QRVeiculo.SetVariable('Ind_Fisica_Juridica','F');
        1 : QRVeiculo.SetVariable('Ind_Fisica_Juridica','J');
        2 : QRVeiculo.SetVariable('Ind_Fisica_Juridica',Null);
      End;
      Case FVeiculoParam.RG0TipoPropriedade.ItemIndex of
        0 : QRVeiculo.SetVariable('IND_TIPO_PROPRIEDADE', 'P');
        1 : QRVeiculo.SetVariable('IND_TIPO_PROPRIEDADE', 'T');
        2 : QRVeiculo.SetVariable('IND_TIPO_PROPRIEDADE', null);
      end;

      QRVeiculo.Open;
      if FRVeiculo = nil then
         FRVeiculo:= TFRVeiculo.Create(Application);
      FRVeiculo.QRLTipoProprietario.Caption := 'Tipo de Propriedade: ' + FVeiculoParam.RG0TipoPropriedade.Items[FVeiculoParam.RG0TipoPropriedade.itemIndex];
      FRVeiculo.QRPrimario.Preview;
    end;
  End;
end;

procedure TFVeiculoCad.SBEstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = nil then
     FEstadoCons:=TFEstadoCons.create(application);
  if FEstadoCons.showmodal = mrOk then
     DMVeiculoConhecimento.QVeiculoCadCod_Estado.value:=DMEstado.QEstadoConsCod_Estado.value;
end;

procedure TFVeiculoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [Dsinsert, DsEdit] then
  Begin
    CMBTipoRodado.Enabled := True;
    CMBTipoCarroceria.Enabled := True;
  end
  else
  Begin
    CMBTipoRodado.Enabled := false;
    CMBTipoCarroceria.Enabled := False;
  end;
end;

procedure TFVeiculoCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    dsprimario.dataset := DMVeiculoConhecimento.QVeiculoCad;
    
end;

procedure TFVeiculoCad.SBConfirmarClick(Sender: TObject);
begin
  DMVeiculoConhecimento.QVeiculoCadIND_TIPO_RODADO.Value := IntToStr(CMBTipoRodado.ItemIndex);
  DMVeiculoConhecimento.QVeiculoCadIND_TIPO_CARROCERIA.Value := IntToStr(CMBTipoCarroceria.ItemIndex);
  DMVeiculoConhecimento.QVeiculoCadCOD_PROPRIETARIO.AsVariant := null;
  inherited;
end;

procedure TFVeiculoCad.DBPCidadeDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;  
end;

procedure TFVeiculoCad.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFVeiculoCad.MELocalizaExit(Sender: TObject);
begin
  inherited;
  with DMVeiculoConhecimento do
  begin
    if QVeiculoCad.RecordCount > 0 then
    begin
      CMBTipoRodado.ItemIndex := QVeiculoCadIND_TIPO_RODADO.AsInteger;
      CMBTipoCarroceria.ItemIndex := QVeiculoCadIND_TIPO_CARROCERIA.AsInteger;
    end;
  end;
end;

end.
