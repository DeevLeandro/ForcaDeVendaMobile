unit DmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,FireDAC.Phys.PGMeta,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.IBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.IB, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tdm_Principal = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Principal: Tdm_Principal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses FrmMenu, FrmVenda;

{$R *.dfm}

end.
