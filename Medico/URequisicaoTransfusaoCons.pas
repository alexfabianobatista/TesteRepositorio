unit URequisicaoTransfusaoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  ExtCtrls, UFmCadastro;

type
  TFRequisicaoTransfusaoCons = class(TFTConsulta)
    FmCadastro1: TFmCadastro;
    RG0Tipo: TRadioGroup;
    GB0DataColeta: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ME0DtInicial: TMaskEdit;
    ME0DtFinal: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRequisicaoTransfusaoCons: TFRequisicaoTransfusaoCons;

implementation

uses UMedico_cl, URequisicaoTransfusao_cl;

{$R *.dfm}

procedure TFRequisicaoTransfusaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMRequisicaoTransfusao do
  begin
    QRequisicaoTransfusaoCons.Close;
    if Trim(FMCadastro1.MeCadastro.Text) <> '' then
      QRequisicaoTransfusaoCons.SetVariable('PACIENTE',Trim(FMCadastro1.MeCadastro.Text))
    Else
      QRequisicaoTransfusaoCons.SetVariable('PACIENTE',NULL);

    If Trim(Me0DtInicial.Text) <> '' then
      QRequisicaoTransfusaoCons.SetVariable('DT_INICIAL',Trim(Me0DtInicial.Text))
    else
      QRequisicaoTransfusaoCons.SetVariable('DT_INICIAL',NULL);

    If Trim(Me0DtFinal.Text) <> '' then
      QRequisicaoTransfusaoCons.SetVariable('DT_FINAL',Trim(Me0DtFinal.Text))
    else
      QRequisicaoTransfusaoCons.SetVariable('DT_FINAL',NULL);

    Case Rg0Tipo.ItemIndex Of
     -1: QRequisicaoTransfusaoCons.SetVariable('TIPO_REQUISICAO',NULL);
      0: QRequisicaoTransfusaoCons.SetVariable('TIPO_REQUISICAO','EMERGENCIA');
      1: QRequisicaoTransfusaoCons.SetVariable('TIPO_REQUISICAO','URGENCIA');
      2: QRequisicaoTransfusaoCons.SetVariable('TIPO_REQUISICAO','ROTINA');
    End;

    QRequisicaoTransfusaoCons.Open;


  end;

end;

end.
