unit UMecanicoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls, Grids, DBGrids, DBPanel, OracleNavigator, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFOFI0001 = class(TFTCadSimples)
    Mecanicos1: TMenuItem;
    PCMecanico: TPageControl;
    TSMecanico: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBECodMecanico: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    TSComissao: TTabSheet;
    DBGComissao: TDBGrid;
    DSMecanicoComissao: TDataSource;
    DBEComissao: TDBEdit;
    Label7: TLabel;
    DBPMecanico: TDBPanel;
    DBPComissao: TDBPanel;
    OracleNavigator1: TOracleNavigator;
    Label6: TLabel;
    DBPFilial: TDBPanel;
    ComissoporMecnico1: TMenuItem;
    DBRadioGroup2: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Mecanicos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure DSMecanicoComissaoStateChange(Sender: TObject);
    procedure ComissoporMecnico1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBPFilialDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPComissaoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOFI0001: TFOFI0001;

implementation

uses UOficina_cl, UFilial_cl, UFilialCons, UMecanicoCons, URMecanicoCad,
  UParamSistema_cl, UComissao_cl, UComissaoCons, UOracle_cl, UOficinaParam,
  URelatorio_cl, URComissaoMecanico, UFmFilial, UFmComissao, UFmMecanico,
  URComissaoProdutoVendedor;

{$R *.DFM}

procedure TFOFI0001.FormActivate(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QMecanicoCad.Close;
    QMecanicoCad.Open;
  end;
  TSComissao.TabVisible := DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS';
end;

procedure TFOFI0001.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FMecanicoCons = nil then
    FMecanicoCons:= TFMecanicoCons.Create(Application);
  if FMecanicoCons.ShowModal = mrOk then
  begin
    with DMOficina do
    begin
      QMecanicoCad.Close;
      QMecanicoCad.SetVariable('PK',QMecanicoConsCOD_MECANICO.Value);
      QMecanicoCad.Open;
    end;
  end;
end;

procedure TFOFI0001.Mecanicos1Click(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QRMecanicoCad.Close;
    QRMecanicoCad.Open;
    if FRMecanicoCad = nil then
      FRMecanicoCad:= TFRMecanicoCad.Create(Application);
    FRMecanicoCad.QRPrimario.Preview;   
  end;
end;

procedure TFOFI0001.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR' then
  begin
    DBECodMecanico.Color := ClWindow;
    DBECodMecanico.ReadOnly := False;
    DBECodMecanico.TabStop := True;
//    DBECodMecanico.TabOrder := 1;
//    DMOficina.QMecanicoCad.SequenceField.FreeInstance;
  end;
end;

procedure TFOFI0001.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS') and
      (DSPrimario.State <> DsBrowse) and
      (PCMecanico.ActivePage = TSComissao) then
  begin
    if Key = '+' then
    begin
      if DSMecanicoComissao.State <> DsBrowse then
        DMOficina.QMecanicoComissaoCad.Post;
      DMOficina.QMecanicoComissaoCad.Append;
      Key := #0;
      DBPComissao.SetFocus;
    end;
    if Key = '-' then
    begin
      if DSMecanicoComissao.State <> DsBrowse then
        DMOficina.QMecanicoComissaoCad.Cancel
      else
        DMOficina.QMecanicoComissaoCad.Delete;
      Key := #0;
    end;
  end;
end;

procedure TFOFI0001.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;
  SBRefresh.Click;
end;

procedure TFOFI0001.SBCancelarClick(Sender: TObject);
begin
  inherited;
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
  SBRefresh.Click;
end;

procedure TFOFI0001.DSMecanicoComissaoStateChange(Sender: TObject);
begin
  inherited;
  DBPComissao.Enabled := (DSMecanicoComissao.State in [DsEdit, DsInsert]);
end;

procedure TFOFI0001.ComissoporMecnico1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
    FOficinaParam := TFOficinaParam.Create(Application);
  FOficinaParam.PGRelatorio.Pages[22].TabVisible := True;
  if FOficinaParam.ShowModal = MrOk then
    with DMOficina_Relatorio do
    begin
      QRComissaoMecanico.Close;
      QRComissaoProdutoVendedor.Close;
      QRComissaoMecanico.ClearVariables;
      QRComissaoProdutoVendedor.ClearVariables;
      if Trim(FOficinaParam.Fm22Filial.MeFilial.Text) <> '' then
      begin
        QRComissaoMecanico.SetVariable('FILIAL', Trim(FOficinaParam.Fm22Filial.MeFilial.Text));
        QRComissaoProdutoVendedor.SetVariable('FILIAL', Trim(FOficinaParam.Fm22Filial.MeFilial.Text));
      end;
      if Trim(FOficinaParam.Fm22Comissao.MeComissao.Text) <> '' then
        QRComissaoMecanico.SetVariable('COMISSAO', Trim(FOficinaParam.Fm22Comissao.MeComissao.Text));
      if Trim(FOficinaParam.Fm22Mecanico.MeMecanico.Text) <> '' then
        QRComissaoMecanico.SetVariable('MECANICO', Trim(FOficinaParam.Fm22Mecanico.MeMecanico.Text));
      if Trim(FOficinaParam.Fm22Datas.MeDtInicial.Text) <> '' then
      begin
        QRComissaoMecanico.SetVariable('DT_ENTRADA_I', FOficinaParam.Fm22Datas.MeDtInicial.Text);
        QRComissaoProdutoVendedor.SetVariable('DT_ENTRADA_I', FOficinaParam.Fm22Datas.MeDtInicial.Text);
      end;
      if Trim(FOficinaParam.Fm22Datas.MeDtFinal.Text) <> '' then
      begin
        QRComissaoMecanico.SetVariable('DT_ENTRADA_F', FOficinaParam.Fm22Datas.MeDtFinal.Text);
        QRComissaoProdutoVendedor.SetVariable('DT_ENTRADA_F', FOficinaParam.Fm22Datas.MeDtFinal.Text);
      end;
      if Trim(FOficinaParam.ME22NumOS.Text) <> '' then
      begin
        QRComissaoMecanico.SetVariable('OS', FOficinaParam.ME22NumOS.Text);
        QRComissaoProdutoVendedor.SetVariable('OS', FOficinaParam.ME22NumOS.Text);
      end;
      if Trim(FOficinaParam.Fm22Vendedor.MeVendedor.Text) <> '' then
        QRComissaoProdutoVendedor.SetVariable('VENDEDOR', Trim(FOficinaParam.Fm22Vendedor.MeVendedor.Text));
      case FOficinaParam.RG22Situacao.ItemIndex of
        0:
        begin
          QRComissaoMecanico.SetVariable('SITUACAO', 'A');
          QRComissaoProdutoVendedor.SetVariable('SITUACAO', 'A');
        end;
        1:
        begin
          QRComissaoMecanico.SetVariable('SITUACAO', 'F');
          QRComissaoProdutoVendedor.SetVariable('SITUACAO', 'F');
        end;
      end;
      QRComissaoMecanico.Open;
      QRComissaoProdutoVendedor.Open;

      if FRComissaoMecanico = nil then
        FRComissaoMecanico := TFRComissaoMecanico.Create(Application);
      if FRComissaoProdutoVendedor = nil then
        FRComissaoProdutoVendedor := TFRComissaoProdutoVendedor.Create(Application);
      FRComissaoMecanico.QRLFilial.Caption := FOficinaParam.Fm22Filial.EdFilial.Text;
      FRComissaoMecanico.QRLComissao.Caption := FOficinaParam.Fm22Comissao.EdComissao.Text;
      FRComissaoMecanico.QRLMecanico.Caption := FOficinaParam.Fm22Mecanico.EdMecanico.Text;
      FRComissaoMecanico.QRLPeriodo.Caption := '';
      FRComissaoMecanico.QRLOS.Caption := FOficinaParam.ME22NumOS.Text;
      if Trim(FOficinaParam.Fm22Datas.MeDtInicial.Text) <> '' then
        FRComissaoMecanico.QRLPeriodo.Caption := 'de ' + FOficinaParam.Fm22Datas.MeDtInicial.Text;
      if (Trim(FOficinaParam.Fm22Datas.MeDtFinal.Text) <> '') then
        FRComissaoMecanico.QRLPeriodo.Caption :=
            FRComissaoMecanico.QRLPeriodo.Caption + ' até ' +
            FOficinaParam.Fm22Datas.MeDtFinal.Text;
      if FOficinaParam.RGPreview.ItemIndex = 0 then
        FRComissaoMecanico.QRCRComissaoMecanico.Preview
      else
        FRComissaoMecanico.QRCRComissaoMecanico.Print;

      QRComissaoMecanico.Close;
      QRComissaoProdutoVendedor.Close;
    end;
end;

procedure TFOFI0001.SBExcluirClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFOFI0001.DBPFilialDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFOFI0001.DBPComissaoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FComissaoCons;
  Classe := TFComissaoCons;
end;

end.
