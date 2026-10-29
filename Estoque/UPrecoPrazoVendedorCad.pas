unit UPrecoPrazoVendedorCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, DBPanel, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus,
  ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFPrecoPrazoVendedorCad = class(TFTCadSimples)
    DBPanel4: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel1: TDBPanel;
    DBPanel5: TDBPanel;
    Opes1: TMenuItem;
    ReajustedePreos1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBConsultaClick(Sender: TObject);
    procedure ReajustedePreos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoPrazoVendedorCad: TFPrecoPrazoVendedorCad;

implementation

uses UPrecoPrazoVendedor_cl, UEstadoCons, UProdutoCons,
  UPrazoVencimentoCons, UPrecoPrazoVendedorCons, UPrecoPrazoEstadoParam,
  UOracle_cl;

{$R *.dfm}

procedure TFPrecoPrazoVendedorCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMPrecoPrazoVendedor.QPrecoPrazoVendedor.Open;
end;

procedure TFPrecoPrazoVendedorCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMPrecoPrazoVendedor.QPrecoPrazoVendedor.Close;
end;

procedure TFPrecoPrazoVendedorCad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEstadoCons;
  Classe := TFEstadoCons;
end;

procedure TFPrecoPrazoVendedorCad.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFPrecoPrazoVendedorCad.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FPrazoVencimentoCons;
  Classe := TFPrazoVencimentoCons;
end;

procedure TFPrecoPrazoVendedorCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPrecoPrazoVendedorCons = Nil then
    FPrecoPrazoVendedorCons:= TFPrecoPrazoVendedorCons.Create(Application);
  If FPrecoPrazoVendedorCons.Showmodal = mrOk then
  With DMPrecoPrazoVendedor do
  Begin
    QPrecoPrazoVendedor.Close;
    QPrecoPrazoVendedor.SetVariable('PK',
      QPrecoPrazoVendedorConsCOD_PRECO_PRAZO_VENDEDOR.Value);
    QPrecoPrazoVendedor.Open;
  End;
end;

procedure TFPrecoPrazoVendedorCad.ReajustedePreos1Click(Sender: TObject);
var exec: TExecutador;
  valReajustado: Double;
  wSql: string;
begin
  inherited;
  if FPrecoPrazoEstadoParam = Nil then
    FPrecoPrazoEstadoParam := TFPrecoPrazoEstadoParam.Create(Application);
  FPrecoPrazoEstadoParam.RGPreview.Visible := false;
  FPrecoPrazoEstadoParam.PGRelatorio.Pages[0].TabVisible := true;
  if FPrecoPrazoEstadoParam.ShowModal = MrOk then
  begin
    FPrecoPrazoEstadoParam.RGPreview.Visible := true;
    with DMPrecoPrazoVendedor do
    begin
      QPrecoPrazoReajuste.Close;

      if Trim(FPrecoPrazoEstadoParam.FmProduto1.MeProduto.Text) <> '' then
        QPrecoPrazoReajuste.SetVariable('COD_PRODUTO'
          , Trim(FPrecoPrazoEstadoParam.FmProduto1.MeProduto.Text))
      else
        QPrecoPrazoReajuste.SetVariable('COD_PRODUTO', null);
      if Trim(FPrecoPrazoEstadoParam.FmEstado1.MeEstado.Text) <> '' then
        QPrecoPrazoReajuste.SetVariable('COD_ESTADO'
          , Trim(FPrecoPrazoEstadoParam.FmEstado1.MeEstado.Text))
      else
        QPrecoPrazoReajuste.SetVariable('COD_ESTADO', null);
      if Trim(FPrecoPrazoEstadoParam.FMPrazoVencimento1.MePrazoVencimento.Text) <> '' then
        QPrecoPrazoReajuste.SetVariable('COD_PRAZO_VENCIMENTO'
          , Trim(FPrecoPrazoEstadoParam.FMPrazoVencimento1.MePrazoVencimento.Text))
      else
        QPrecoPrazoReajuste.SetVariable('COD_PRAZO_VENCIMENTO', null);

      QPrecoPrazoReajuste.Open;

      if Trim(FPrecoPrazoEstadoParam.MePercentual.Text) = '' then
      begin
        MessageDlg('Percentual de reajuste não informado'
          , mtError, [mbOk], 0);
        Exit;
      end;

      if QPrecoPrazoReajuste.IsEmpty then
      begin
        MessageDlg('Nenhum produto encontrado', mtError, [mbOk], 0);
        Exit;
      end
      else
        if MessageDlg('Os preços dos produtos serão reajustados em '
          + Trim(FPrecoPrazoEstadoParam.MePercentual.Text) + '%'
          , mtConfirmation, [mbOk, mbCancel], 0) = mrCancel then
          Exit;

      exec := TExecutador.Create;
      while not QPrecoPrazoReajuste.Eof do
      begin
        try
          valReajustado := 0;
          if FPrecoPrazoEstadoParam.RGReajuste.ItemIndex = 0 then
            valReajustado := QPrecoPrazoReajusteVAL_PRODUTO.Value
              + (QPrecoPrazoReajusteVAL_PRODUTO.Value
                * StrToFloat(Trim(FPrecoPrazoEstadoParam.MePercentual.Text))/100)
          else
            valReajustado := QPrecoPrazoReajusteVAL_PRODUTO.Value
              - (QPrecoPrazoReajusteVAL_PRODUTO.Value
                * StrToFloat(Trim(FPrecoPrazoEstadoParam.MePercentual.Text))/100);

          exec.Limpa;

          wSql := '';
          wSql := 'UPDATE TB_PRECO_PRAZO_VENDEDOR SET VAL_PRODUTO = '
            + StringReplace(FloatToStr(valReajustado), ',', '.', [rfReplaceAll])
            + ' WHERE COD_PRECO_PRAZO_VENDEDOR = '
            + QPrecoPrazoReajusteCOD_PRECO_PRAZO_VENDEDOR.Text;

          exec.Adiciona(wSql);
          exec.Executar(true, false);
          QPrecoPrazoReajuste.Next;

        Except
          on e: Exception do
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg(e.Message, mtError, [mbok], 0);
            Exit;
          end;
        end;

      end;

      exec.Fecha;
      DMOracle.DBCemapa.Commit;
      MessageDlg(IntToStr(QPrecoPrazoReajuste.RecordCount)
        + ' registros foram atualizados', mtInformation, [mbOk],0);
    end;
  end;
end;

end.
