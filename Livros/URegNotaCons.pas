unit URegNotaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFRegNotaCons = class(TFTConsulta)
    MENumNota: TMaskEdit;
    Label2: TLabel;
    MeEmissaoInicial: TMaskEdit;
    MeEmissaoFinal: TMaskEdit;
    MeRecebimentoInicial: TMaskEdit;
    MeRecebimentoFinal: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MeCodCadastro: TMaskEdit;
    Label7: TLabel;
    BtnCadastroCons: TBitBtn;
    RGSituacao: TRadioGroup;
    RGTipoNota: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCadastroConsClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegNotaCons: TFRegNotaCons;

implementation

uses URegNota_cl, UCadastroCons, UCadastro_cl;

{$R *.DFM}

procedure TFRegNotaCons.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  Action := CaFree;
//  FRegNotaCons := nil;
end;

procedure TFRegNotaCons.BtnCadastroConsClick(Sender: TObject);
begin
  inherited;
  If(FCadastroCons = nil)Then
    FCadastroCons := TFCadastroCons.Create(Application);
  If(FCadastroCons.Showmodal = mrOk)Then
    MeCodCadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFRegNotaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMRegNota Do
  Begin
    QRegNotaCons.Close;
    If(Trim(MeCodCadastro.Text) <> '')Then
      QRegNotaCons.SetVariable('CADASTRO',Trim(MeCodCadastro.Text))
    Else
      QRegNotaCons.SetVariable('CADASTRO',null);

    If(Trim(MENumNota.Text) <> '')Then
      QRegNotaCons.SetVariable('NUM_NOTA',Trim(MENumNota.Text))
    Else
      QRegNotaCons.SetVariable('NUM_NOTA',null);

    If(Trim(MeEmissaoInicial.Text) <> '')Then
      QRegNotaCons.SetVariable('DT_EMISSAO_INICIAL',Trim(MeEmissaoInicial.Text))
    Else
      QRegNotaCons.SetVariable('DT_EMISSAO_INICIAL','01/01/1900');

    If(Trim(MeEmissaoFinal.Text) <> '')Then
      QRegNotaCons.SetVariable('DT_EMISSAO_FINAL',Trim(MeEmissaoFinal.Text))
    Else
      QRegNotaCons.SetVariable('DT_EMISSAO_FINAL','02/02/2030');

    If(Trim(MeRecebimentoInicial.Text) <> '')Then
      QRegNotaCons.SetVariable('DT_RECEBIMENTO_INICIAL',Trim(MeRecebimentoInicial.Text))
    Else
      QRegNotaCons.SetVariable('DT_RECEBIMENTO_INICIAL','01/01/1900');

    If(Trim(MeRecebimentoFinal.Text) <> '')Then
      QRegNotaCons.SetVariable('DT_RECEBIMENTO_FINAL',Trim(MeRecebimentoFinal.Text))
    Else
      QRegNotaCons.SetVariable('DT_RECEBIMENTO_FINAL','02/02/2030');

    If(RGSituacao.ItemIndex = 0)Then
      QRegNotaCons.SetVariable('SITUACAO','2')
    Else
      QRegNotaCons.SetVariable('SITUACAO','3');

    If(RGTipoNota.ItemIndex = 0)Then
      QRegNotaCons.SetVariable('IND_ENTRADA_SAIDA','E')
    Else
      QRegNotaCons.SetVariable('IND_ENTRADA_SAIDA','S');

    QRegNotaCons.Open;
  End;
end;

end.
