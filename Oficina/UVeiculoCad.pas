unit UVeiculoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, DBPanel, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFOFI0020 = class(TFTCadSimples)
    Veiculos1: TMenuItem;
    PageControl1: TPageControl;
    TSGeral: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    TSAgronews: TTabSheet;
    DBPCor: TDBPanel;
    DBPCaracteristica: TDBPanel;
    DBPNumEixo: TDBPanel;
    DBPNumMotor: TDBPanel;
    DBPCadastro: TDBPanel;
    DBPModelo: TDBPanel;
    PAgronews: TPanel;
    Label8: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    DBMObservacao: TDBMemo;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit24: TDBEdit;
    DBPPlataforma: TDBPanel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBPPlaca: TDBPanel;
    DBPNumCertificado: TDBPanel;
    GroupBox2: TGroupBox;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    DBPanel6: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Veiculos1Click(Sender: TObject);
    procedure DBPPlataformaDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
    procedure FormCreate(Sender: TObject);
    function AgronewsRenderizar(Sender: TOBject): Boolean;
    procedure DBPCadastroDefine(Sender: TObject;
      var QueryConsulta: TDataSet; var FormConsulta: TForm);
    procedure DBPModeloDefine(Sender: TObject; var QueryConsulta: TDataSet;
      var FormConsulta: TForm);
    procedure DBPNumAnoFieldKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

var
  FOFI0020: TFOFI0020;
  Nome: String;

implementation

uses UOficina_cl, UCadastroCons, UCadastro_cl, UVeiculoModeloCons,
  UVeiculoCons, UOficinaParam, URVeiculoCad, UMarcaCons, UParamSistema_cl,
  UMarca_cl, UVeiculo_cl, UBiblioteca;

{$R *.DFM}

procedure TFOFI0020.FormActivate(Sender: TObject);
begin
  Veiculos1.Caption := '&Veiculos';
  inherited;
  with DMOficina do
  begin
    QVeiculoCad.Close;
    QVeiculoCad.Open;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
    Veiculos1.Caption := '&Equipamento';
end;

procedure TFOFI0020.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  if FVeiculoCons.ShowModal = mrOk then
  with DMOficina do
  begin
    QVeiculoCad.Close;
    QVeiculoCad.SetVariable('PK',QVeiculoConsCOD_VEICULO.Value);
    QVeiculoCad.Open;
  end;
end;

procedure TFOFI0020.Veiculos1Click(Sender: TObject);
begin
  inherited;

  if FOficinaParam = nil then
     FOficinaParam:= TFOficinaParam.Create(Application);
  FOficinaParam.PGRelatorio.Pages[1].TabVisible:= True;
  if FOficinaParam.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      QRVeiculo.Close;
      if Trim(FOficinaParam.MECor.Text) = '' then
         QRVeiculo.SetVariable('DESC_COR',Null)
      else
         QRVeiculo.SetVariable('DESC_COR','%'+FOficinaParam.MECor.Text+'%');

      if Trim(FOficinaParam.MEChassi.Text) = '' then
         QRVeiculo.SetVariable('NUM_CHASSI',Null)
      else
         QRVeiculo.SetVariable('NUM_CHASSI','%'+FOficinaParam.MEChassi.Text+'%');

      if Trim(FOficinaParam.MEPlaca.Text) = '' then
         QRVeiculo.SetVariable('NUM_PLACA',Null)
      else
         QRVeiculo.SetVariable('NUM_PLACA','%'+FOficinaParam.MEPlaca.Text+'%');

      if Trim(FOficinaParam.MECadastroCod.Text) = '' then
         QRVeiculo.SetVariable('COD_CADASTRO',Null)
      else
         QRVeiculo.SetVariable('COD_CADASTRO',FOficinaParam.MECadastroCod.Text);

      QRVeiculo.Open;

      if FRVeiculoCad = nil then
         FRVeiculoCad:= TFRVeiculoCad.Create(Application);

      if FOficinaParam.RGPreview.ItemIndex = 0 then
         FRVeiculoCad.QRPrimario.Preview
      else
         FRVeiculoCad.QRPrimario.Print;

      QRVeiculo.Close;

    end;
  end;

end;

procedure TFOFI0020.DBPPlataformaDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FVeiculoCons = nil then
    FVeiculoCons := TFVeiculoCons.Create(Application);
  QueryConsulta := DMVeiculo.QVeiculoCons;
  FormConsulta := FVeiculoCons;
end;

procedure TFOFI0020.FormCreate(Sender: TObject);
var
  b: Boolean;
begin
  inherited;
  TSAgronews.TabVisible := False;
  b := DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS';
  PAgronews.Visible := b;
  if b then
  begin
    Self.Height := Self.Height + 160;
    Self.Constraints.MinHeight := Self.Height;

    Bib.inverteControles(DBPNumMotor, DBPPlaca, true, true, true);
    DBPNumMotor.TabOrder := DBPPlaca.TabOrder;
    PAgronews.Parent := TSGeral;
    Bib.inverteControles(DBPCaracteristica, PAgronews);
    PAgronews.Anchors := DBPCaracteristica.Anchors + [akBottom];

    DBPNumCertificado.DataField := 'DT_REV_PRE_ENTREGA';
    DBPNumCertificado.LCaption := 'Dt Rev. Pré-Entrega';
    //LblDtRevisao.Caption := 'Dt Rev. Ent. Técnica';
  end;
end;

function TFOFI0020.AgronewsRenderizar(Sender: TOBject): Boolean;
begin                                                                          
  Result := DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS';
end;

procedure TFOFI0020.DBPCadastroDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  FormConsulta := FCadastroCons;
  QueryConsulta := DMCadastro.QCadastroCons;
end;

procedure TFOFI0020.DBPModeloDefine(Sender: TObject;
  var QueryConsulta: TDataSet; var FormConsulta: TForm);
begin
  inherited;
  if FVeiculoModeloCons = nil then
    FVeiculoModeloCons := TFVeiculoModeloCons.Create(Application);
  FormConsulta := FVeiculoModeloCons;
  QueryConsulta := DMOficina.QVeiculoModeloCons;
end;

procedure TFOFI0020.DBPNumAnoFieldKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Length(TDBEdit(Sender).Text) >= 4) and (Key <> #8) then
    Key := #0;
end;

procedure TFOFI0020.FormShow(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    Nome := Self.Caption;
    Self.Caption := 'Equipamento';
  end;
end;

procedure TFOFI0020.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
    Self.Caption := Nome;
end;

end.
