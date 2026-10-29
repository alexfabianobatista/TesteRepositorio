unit UProprietarioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, DBPanel;

type
  TFProprietarioCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    RelaoProprietarios1: TMenuItem;
    DBEdit3: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    Opo1: TMenuItem;
    MudaSituao1: TMenuItem;
    DBPCidade: TDBPanel;
    DBPEstado: TDBPanel;
    DBRadioGroup3: TDBRadioGroup;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBProprietarioClick(Sender: TObject);
    procedure RelaoProprietarios1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure MudaSituao1Click(Sender: TObject);
    procedure DBPCidadeDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel5DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProprietarioCad: TFProprietarioCad;

implementation

uses UProprietario_cl, UProprietarioCons, UEstadoCons, UEstado_cl,
  URProprietario, UVeiculoParam, UBiblioteca, UProprietarioSituacao,
  UParamSistema_cl, UOracle_cl, UCidadeCons, UTipoCadastroCons, StrUtils;

{$R *.DFM}

procedure TFProprietarioCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMProprietario.QProprietarioCad.open;
end;

procedure TFProprietarioCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMProprietario.QProprietarioCad.close;
  DMProprietario.QProprietarioCons.close;
  action := CaFree;
  FProprietarioCad := nil;
end;

procedure TFProprietarioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FProprietarioCons = nil then
    FProprietarioCons := TFProprietarioCons.Create(Application);
  if FProprietarioCons.ShowModal = mrOk then
  begin
    with DMProprietario do
    begin
      QProprietarioCad.Close;
      QProprietarioCad.SetVariable('PK', QProprietarioConsCod_Proprietario.Value);
      QProprietarioCad.Open;
    end;
  end;
end;

procedure TFProprietarioCad.SBProprietarioClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = nil then
    FEstadoCons := TFEstadoCons.create(application);
  if FEstadoCons.showmodal = mrOk then
    DMProprietario.QProprietarioCadCod_Estado.value := DMEstado.QEstadoConsCod_Estado.value;
end;

procedure TFProprietarioCad.RelaoProprietarios1Click(Sender: TObject);
begin
  inherited;
  if FVeiculoParam = nil then
    FVeiculoParam := TFVeiculoParam.Create(Application);
  FVeiculoParam.PGRelatorio.Pages[1].TabVisible := True;
  if FVeiculoParam.ShowModal = mrOk then
  begin
    with DMProprietario do
    begin
      QRProprietario.Close;
      if Trim(FVeiculoParam.Me1CodEstado.Text) <> '' then
        QRProprietario.SetVariable('Cod_Estado', Trim(FVeiculoParam.Me1CodEstado.Text))
      else
        QRProprietario.SetVariable('Cod_Estado', Null);
      if Trim(FVeiculoParam.Me1Cnpj.text) <> '' then
        QRProprietario.SetVariable('NUM_CNPJ_CGC', Trim(FVeiculoParam.Me1Cnpj.Text))
      else
        QRProprietario.SetVariable('NUM_CNPJ_CGC', Null);

      case FVeiculoParam.Rg1Tipo.ItemIndex of
        0: QRProprietario.SetVariable('Ind_Fisica_Juridica', 'F');
        1: QRProprietario.SetVariable('Ind_Fisica_Juridica', 'J');
        2: QRProprietario.SetVariable('Ind_Fisica_Juridica', Null);
      end;
      case FVeiculoParam.Rg1Situacao.ItemIndex of
        0: QRProprietario.SetVariable('Ind_Situacao', 'A');
        1: QRProprietario.SetVariable('Ind_Situacao', 'D');
        2: QRProprietario.SetVariable('Ind_Situacao', Null);
      end;
      if trim(FVeiculoParam.FmTipoCadastro1.MeTipoCadastro.Text) <> '' then
        QRProprietario.SetVariable('COD_TIPO_CADASTRO',Trim(FVeiculoParam.FmTipoCadastro1.MeTipoCadastro.Text))
      else
        QRProprietario.SetVariable('COD_TIPO_CADASTRO', null);
      QRProprietario.Open;
      if FRProprietario = nil then
        FRProprietario := TFRProprietario.Create(Application);
      FRProprietario.QRPrimario.Preview;
      QRProprietario.Close;
    end;
  end;
end;

procedure TFProprietarioCad.SBConfirmarClick(Sender: TObject);
begin
  with DmProprietario do
  begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'NUTRI' then
    begin
      if DBRadioGroup1.ItemIndex = 0 then
      begin
        if not (Bib.ValidaCpf(QProprietarioCadNUM_CNPJ_CGC.Value)) then
          raise Exception.Create('Cpf Inválido');
      end
      else if not (Bib.ValidaCgc(QProprietarioCadNUM_CNPJ_CGC.Value)) then
        raise Exception.Create('Cnpj Inválido')
    end;
  end;
  inherited;

end;

procedure TFProprietarioCad.MudaSituao1Click(Sender: TObject);
begin
  inherited;
  if DMProprietario.QProprietarioCadCOD_PROPRIETARIO.Text = '' then
    raise Exception.Create('Para Mudar a Situação necessita de um Proprietário');
  if FProprietarioSituacao = nil then
    FProprietarioSituacao := TFProprietarioSituacao.Create(Application);
  if DMProprietario.QProprietarioCadInd_Situacao.Value = 'A' then
    FProprietarioSituacao.RgSituacao.ItemIndex := 0
  else
    FProprietarioSituacao.RgSituacao.ItemIndex := 1;
  FProprietarioSituacao.ShowModal;
  DMProprietario.QProprietarioCad.Close;
  DMProprietario.QProprietarioCad.Open;

end;

procedure TFProprietarioCad.DBPCidadeDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCidadeCons;
  Classe := TFCidadeCons;
end;

procedure TFProprietarioCad.DBPanel5DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FTipoCadastroCons;
  Classe := TFTipoCadastroCons;
end;

end.

