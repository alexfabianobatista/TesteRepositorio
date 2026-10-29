unit UOSPatrimonioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFOSPatrimonioCons = class(TFTConsulta)
    EDNumOS: TEdit;
    Label2: TLabel;
    EDItemPatrimonio: TEdit;
    Label3: TLabel;
    BTProcedimento: TBitBtn;
    EDDepartamento: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    MEDTEncerramento: TMaskEdit;
    Label5: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure BTProcedimentoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOSPatrimonioCons: TFOSPatrimonioCons;

implementation

uses UOSPatrimonio_cl, UPatrimonioItemCons, Upatrimonio_cl,
  UDepartamentoCons, UDepartamento_cl;

{$R *.DFM}

procedure TFOSPatrimonioCons.FormActivate(Sender: TObject);
begin
  inherited;
  MEDTEncerramento.text:=DateToStr(Date);
end;

procedure TFOSPatrimonioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMOSPatrimonio.QOSPatrimonioCons.close;
  WITH DMOSPatrimonio DO
  Begin
     if METexto.text = '' then
       QOSPatrimonioCons.setvariable('Desc_os_patrimonio',Null)
     else
       QOSPatrimonioCons.setvariable('Desc_os_patrimonio',METexto.text);
     if MEDTEncerramento.text = '' then
       QOSPatrimonioCons.setvariable('DT_PREVISTA',Null)
     else
       QOSPatrimonioCons.setvariable('DT_PREVISTA',MEDTEncerramento.text);
     if EDDepartamento.text = '' then
       QOSPatrimonioCons.setvariable('Cod_Departamento',Null)
     else
       QOSPatrimonioCons.setvariable('Cod_Departamento',EDDepartamento.text);
     if EDItemPatrimonio.text = '' then
       QOSPatrimonioCons.setvariable('Cod_Patrimonio_Item',Null)
     else
       QOSPatrimonioCons.setvariable('Cod_Patrimonio_Item',EDItemPatrimonio.text);
     if EDNumOS.text = '' then
       QOSPatrimonioCons.setvariable('NUM_OS_CAB',Null)
     else
       QOSPatrimonioCons.setvariable('NUM_OS_CAB',EDNumOS.text);
  end;
  DMOSPatrimonio.QOSPatrimonioCons.Open;
end;

procedure TFOSPatrimonioCons.BTProcedimentoClick(Sender: TObject);
begin
  inherited;
   If FPatrimonioItemCons = Nil then
    FPatrimonioItemCons := TFPatrimonioItemCons.Create(Application);
  If FPatrimonioItemCons.showModal = mrOk then
    FOSPatrimonioCons.EDItemPatrimonio.text := DMPatrimonio.QPatrimonio_Item_ConsCod_Patrimonio_Item.Value;
end;

procedure TFOSPatrimonioCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.showModal = mrOk then
    FOSPatrimonioCons.EDDepartamento.text := IntToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

end.
