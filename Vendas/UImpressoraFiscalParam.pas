unit UImpressoraFiscalParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, UFmDatas, Mask, Buttons, Grids,
  DBGrids, DBCtrls, ActnList;

type
  TFImpressoraFiscalParam = class(TForm)
    PGRelatorio: TPageControl;
    TabSheet1: TTabSheet;
    rg1TipoSaida: TRadioGroup;
    rg1TipoParam: TRadioGroup;
    gb1ParametrosReducao: TGroupBox;
    meReducaoInicial: TMaskEdit;
    meReducaoFinal: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Fm1Datas: TFmDatas;
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    TabSheet2: TTabSheet;
    rg2TipoParamentro: TRadioGroup;
    Fm2Datas: TFmDatas;
    gb2COO: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    meCOOInicial: TMaskEdit;
    meCOOFinal: TMaskEdit;
    TabSheet3: TTabSheet;
    rg3Tipo: TRadioGroup;
    gb3EstoqueParcial: TGroupBox;
    rg3TipoParametro: TRadioGroup;
    dbg3Parametros: TDBGrid;
    BitBtn1: TBitBtn;
    TabSheet4: TTabSheet;
    Label5: TLabel;
    FM4Datas: TFmDatas;
    DBLCImpressora4: TDBLookupComboBox;
    TabSheet5: TTabSheet;
    Fm5Datas: TFmDatas;
    fm3Datas: TFmDatas;
    rg1Tipo: TRadioGroup;
    ActionList1: TActionList;
    Action1: TAction;
    procedure rg1TipoParamClick(Sender: TObject);
    procedure rg2TipoParamentroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure rg3TipoParametroClick(Sender: TObject);
    procedure rg3TipoParametroEnter(Sender: TObject);
    procedure rg3TipoClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImpressoraFiscalParam: TFImpressoraFiscalParam;
  ValorAnterior: Integer;
implementation

uses UImpressoraFiscal_cl, UImpressoraFiscal, UAguarde;

{$R *.dfm}

procedure TFImpressoraFiscalParam.rg1TipoParamClick(Sender: TObject);
begin
  if rg1TipoParam.ItemIndex = 0 then
  begin
    Fm1Datas.MeDtInicial.Enabled := true;
    Fm1Datas.MeDtFinal.Enabled := true;
    meReducaoInicial.Enabled := false;
    meReducaoFinal.Enabled := false;
    meReducaoInicial.Clear;
    meReducaoFinal.Clear;
    Fm1Datas.MeDtInicial.SetFocus;
    Fm1Datas.MeDtInicial.SelectAll;
  end
  else
  begin
    Fm1Datas.MeDtInicial.Enabled := false;
    Fm1Datas.MeDtFinal.Enabled := false;
    meReducaoInicial.Enabled := true;
    meReducaoFinal.Enabled := true;
    Fm1Datas.MeDtInicial.Clear;
    Fm1Datas.MeDtFinal.Clear;
    meReducaoInicial.SetFocus;
    meReducaoInicial.SelectAll;
  end;
end;

procedure TFImpressoraFiscalParam.rg2TipoParamentroClick(Sender: TObject);
begin
  if rg2TipoParamentro.ItemIndex = 0 then
  begin
    Fm2Datas.MeDtInicial.Enabled := true;
    Fm2Datas.MeDtFinal.Enabled := true;
    meCOOInicial.Enabled := false;
    meCOOFinal.Enabled := false;
    meCOOInicial.Clear;
    meCOOFinal.Clear;
    Fm2Datas.MeDtInicial.SetFocus;
    Fm2Datas.MeDtInicial.SelectAll;
  end
  else
  begin
    Fm2Datas.MeDtInicial.Enabled := false;
    Fm2Datas.MeDtFinal.Enabled := false;
    meCOOInicial.Enabled := true;
    meCOOFinal.Enabled := true;
    meCOOInicial.SetFocus;
    meCOOInicial.SelectAll;
    Fm2Datas.MeDtInicial.Clear;
    Fm2Datas.MeDtFinal.Clear;
  end;
end;

procedure TFImpressoraFiscalParam.FormCreate(Sender: TObject);
var
  wQtdePagina: Integer;
begin
  For wQtdePagina := 0 to PGRelatorio.PageCount-1 do
    PGRelatorio.Pages[wQtdePagina].TabVisible := False;
  DMImpressoraFiscal.cdsParametrosEstoque.Open;
end;

procedure TFImpressoraFiscalParam.FormDeactivate(Sender: TObject);
var
  wQtdePagina: Integer;
begin
  For wQtdePagina := 0 to PGRelatorio.PageCount-1 do
    PGRelatorio.Pages[wQtdePagina].TabVisible := False;
end;

procedure TFImpressoraFiscalParam.BitBtn1Click(Sender: TObject);
begin
  if (MessageDlg('Deseja realmente excluir o item selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    DMImpressoraFiscal.cdsParametrosEstoque.Delete;
end;

procedure TFImpressoraFiscalParam.rg3TipoParametroClick(Sender: TObject);
begin
  dbg3Parametros.Columns[0].Visible := rg3TipoParametro.ItemIndex = 0;
  dbg3Parametros.Columns[1].Visible := rg3TipoParametro.ItemIndex <> 0;
  if valorAnterior <> rg3TipoParametro.ItemIndex then
  begin
    with DMImpressoraFiscal do
    begin
      cdsParametrosEstoque.First;
      while not cdsParametrosEstoque.Eof do
        cdsParametrosEstoque.Delete;
    end;
  end;
end;

procedure TFImpressoraFiscalParam.rg3TipoParametroEnter(Sender: TObject);
begin
  ValorAnterior := rg3TipoParametro.ItemIndex;
end;

procedure TFImpressoraFiscalParam.rg3TipoClick(Sender: TObject);
begin
  gb3EstoqueParcial.Visible := rg3Tipo.ItemIndex = 1; 
end;

procedure TFImpressoraFiscalParam.Action1Execute(Sender: TObject);
begin
  FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
