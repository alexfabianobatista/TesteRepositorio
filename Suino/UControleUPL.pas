unit UControleUPL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls;

type
  TFControleUPL = class(TFTCadSimples)
    RelatoriodeUPL1: TMenuItem;
    procedure RelatoriodeUPL1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleUPL: TFControleUPL;

implementation

uses USuinoParam, USuino_cl, UUsuario_cl, UrUPL_Rel;

{$R *.dfm}

procedure TFControleUPL.RelatoriodeUPL1Click(Sender: TObject);
begin
  inherited;
  if FSuinoParam = nil then
    FSuinoParam := TFSuinoParam.Create(Application);
  FSuinoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FSuinoParam.ShowModal = mrOk then
    with DmSuino do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FSuinoParam.Fm0Filial.MeFilial.Text), 'SUINO');
      QRReceitaDespesa.Close;
      QRReceitaDespesa.SetVariable('DATA_INI', FSuinoParam.Me0DataIni.Text);
      QRReceitaDespesa.SetVariable('DATA_FIN', FSuinoParam.Me0DataFin.Text);

      if Trim(FSuinoParam.Fm0Filial.MeFilial.Text) = '' then
        QRReceitaDespesa.SetVariable('COD_FILIAL', Null)
      else
        QRReceitaDespesa.SetVariable('COD_FILIAL', Trim(FSuinoParam.Fm0Filial.MeFilial.Text));

      if Trim(FSuinoParam.Fm0Cadastro.MeCadastro.Text) = '' then
        QRReceitaDespesa.SetVariable('COD_CADASTRO', Null)
      else
        QRReceitaDespesa.SetVariable('COD_CADASTRO', Trim(FSuinoParam.Fm0Cadastro.MeCadastro.Text));

      QRReceitaDespesa.Open;
      if FSuinoParam = nil then
        FSuinoParam := TFSuinoParam.Create(Application);

      FrUPL_Rel.QRLTitulo.Caption := 'Relatório da UPL ' + FSuinoParam.Me0DataIni.Text + ' até ' + FSuinoParam.Me0DataFin.Text;

      if FSuinoParam.RGPreview.ItemIndex = 0 then
        FrUPL_Rel.QRPrimario.Preview
      else
        FrUPL_Rel.QRPrimario.Print;
      QRReceitaDespesa.Close;
    end;

end;

end.
