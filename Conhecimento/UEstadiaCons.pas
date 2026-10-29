unit UEstadiaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFEstadiaCons = class(TFTConsulta)
    BtFilial: TSpeedButton;
    MEFilial: TMaskEdit;
    Label2: TLabel;
    MECadastro: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    MEDtEmissao: TMaskEdit;
    BtCadastro: TSpeedButton;
    RGSituacao: TRadioGroup;
    procedure BtFilialClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure BtCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadiaCons: TFEstadiaCons;

implementation

uses UConhecimento_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFEstadiaCons.BtFilialClick(Sender: TObject);
begin
  inherited;
   if FFilialCons = nil then
     FFilialCons:=TFFilialCons.create(application);
   if FFilialCons.showmodal = mrOk then
     MEFilial.Text:=IntToStr(DMFilial.QFilialConsCod_Filial.value);
end;

procedure TFEstadiaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    QEstadiaCons.Close;

    if Trim(METexto.Text) <> '' then
      QEstadiaCons.SetVariable('NUM_ESTADIA', StrToInt(Trim(METexto.Text)))
    else
      QEstadiaCons.SetVariable('NUM_ESTADIA', NULL);

    if Trim(MEFilial.Text) <> '' then
      QEstadiaCons.SetVariable('COD_FILIAL', StrToInt(Trim(MEFilial.Text)))
    else
      QEstadiaCons.SetVariable('COD_FILIAL',NULL);

    if Trim(MEDtEmissao.Text) <> '/  /' then
      QEstadiaCons.SetVariable('DT_EMISSAO', StrToDate(Trim(MEDtEmissao.Text)))
    else
      QEStadiaCons.SetVariable('DT_EMISSAO', NULL);

    if Trim(MECadastro.Text) <> '' then
      QEstadiaCons.SetVariable('COD_CADASTRO', Trim(MECadastro.Text))
    else
      QEstadiaCons.SetVariable('COD_CADASTRO', NULL);

    if RGSituacao.ItemIndex = 1 then
      QEstadiaCons.SetVariable('IND_SITUACAO', 'DIGITADA')
    else if RGSituacao.ItemIndex = 2 then
      QEstadiaCons.SetVariable('IND_SITUACAO', 'CONFIRMADA')
    else
      QEstadiaCons.SetVariable('IND_SITUACAO', NULL);

    QEstadiaCons.Open;
  end;
end;

procedure TFEstadiaCons.BtCadastroClick(Sender: TObject);
begin
  inherited;
   if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
     MECadastro.Text:=IntToStr(DMCadastro.QCadastroConsCod_Cadastro.value);
end;

end.
